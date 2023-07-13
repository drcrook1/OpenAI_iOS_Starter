using System;
using CoPilotBackEnd.Options;
using Microsoft.Extensions.Options;
using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.CoreSkills;
using Microsoft.SemanticKernel.TemplateEngine;

namespace CoPilotBackEnd.Extensions
{
    internal static class SemanticKernelExtensions
    {
        /// <summary>
        /// Add Semantic Kernel services
        /// </summary>
        internal static IServiceCollection AddSemanticKernelServices(this IServiceCollection services)
        {
            // Semantic Kernel
            services.AddScoped<IKernel>(sp =>
            {
                IKernel kernel = Kernel.Builder
                    .WithCompletionBackend(sp.GetRequiredService<IOptions<AIServiceOptions>>().Value)
                    .Build();
                RegisterSkillsAsync(kernel);

                return kernel;
            });

            return services;
        }


        /// <summary>
        /// Add the completion backend to the kernel config
        /// This creates the WithCompletionBackend for the Kernel Builder.
        /// </summary>
        private static KernelBuilder WithCompletionBackend(this KernelBuilder kernelBuilder,
            AIServiceOptions options)
        {
            return kernelBuilder.WithAzureChatCompletionService(options.Models.Completion,
                options.Endpoint,
                options.APIKey);
        }

        /// <summary>
        /// Parses the configuration into options.
        /// </summary>
        /// <param name="services"></param>
        /// <param name="configuration"></param>
        /// <returns></returns>
        internal static IServiceCollection AddSemanticKernelOptions(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddOptions<AIServiceOptions>()
                .Bind(configuration.GetSection(AIServiceOptions.PropertyName))
                .ValidateOnStart()
                .ValidateDataAnnotations();
            return services;
        }

        /// <summary>
        /// Register the skills with the kernel.
        /// </summary>
        private static void RegisterSkillsAsync(IKernel kernel)
        {
            var travelAgentSkillDirectory = Path.Combine("Skills");
            // Register Travel Agent Skill
            var agentSkill = kernel.ImportSemanticSkillFromDirectory(travelAgentSkillDirectory, "TravelAgentSkill");

        }
    }
}

