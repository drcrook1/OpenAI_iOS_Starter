using System;
using CoPilotBackEnd.Options;
using CoPilotBackEnd.Services;
using Microsoft.Extensions.Options;
using Microsoft.SemanticKernel;

namespace CoPilotBackEnd.Extensions
{
    internal static class CoPilotExtensions
	{
        /// <summary>
        /// Add Semantic Kernel services
        /// </summary>
        internal static IServiceCollection AddCoPilotService(this IServiceCollection services)
        {
            // Semantic Kernel
            services.AddScoped<ICoPilotService>(sp =>
            {
                IKernel kernel = Kernel.Builder
                                    .BuildKernel(sp.GetRequiredService<IOptions<AIServiceOptions>>().Value);
                ICoPilotService copilotService = new CoPilotService(kernel);
                return copilotService;
            });

            return services;
        }

        /// <summary>
        /// Parses the configuration into options.
        /// </summary>
        /// <param name="services"></param>
        /// <param name="configuration"></param>
        /// <returns></returns>
        internal static IServiceCollection AddAIServiceOptions(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddOptions<AIServiceOptions>()
                .Bind(configuration.GetSection(AIServiceOptions.PropertyName))
                .ValidateOnStart()
                .ValidateDataAnnotations();
            return services;
        }
    }
}

