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

        internal static IKernel BuildKernel(this KernelBuilder kernelBuilder,
            AIServiceOptions options)
        {
            IKernel kernel = Kernel.Builder
                .WithCompletionBackend(options)
                .Build();
            RegisterSkillsAsync(kernel);

            return kernel;
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

