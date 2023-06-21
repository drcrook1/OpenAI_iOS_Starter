using System;
using System.ComponentModel.DataAnnotations;

namespace CoPilotBackEnd.Options
{
    /// <summary>
    /// AI models to use.  Currently we only support 1 model.
    /// </summary>
    public class ModelTypes
    {
        /// <summary>
        /// Azure OpenAI deployment name or OpenAI model name to use for completions.
        /// </summary>
        [Required]
        public string Completion { get; set; } = string.Empty;
        [Required]
        public string OtherFunModel { get; set; } = string.Empty;

    }

    public sealed class AIServiceOptions
    {
        public const string PropertyName = "AIService";

        [Required]
        public string Endpoint { get; set; } = string.Empty;

        [Required]
        public string APIKey { get; set; } = string.Empty;

        [Required]
        public ModelTypes Models { get; set; } = new ModelTypes();
    }
}

