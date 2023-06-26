using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CoPilotBackEnd.DataModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.SemanticFunctions;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CoPilotBackEnd.Controllers
{
    [ApiController]
    [Route("api/v1/[controller]")]
    public class OpenAIController : Controller
    {

        [HttpPost]
        [Route("interesting")]
        [Produces("application/json")]
        public async Task<ActionResult<ChatResponse>> SayMore(ChatRequest chatRequest)
        {
            ChatResponse response = await Task.Run(() =>
            {
                return new ChatResponse(chatRequest.request + "is an interesting request.");
            });
            return Ok(response);
        }

        [HttpPost]
        [Route("chat")]
        [Produces("application/json")]
        public async Task<ActionResult<ChatResponse>> Chat(
            [FromBody]ChatRequest chatRequest,
            [FromServices]IKernel kernel)
        {
            string skPrompt = """
            {{$input}}

            Respond to above lyrically and funny.
            """;
            var promptConfig = new PromptTemplateConfig
            {
                Completion =
                {
                    MaxTokens = 2000,
                    Temperature = 0.2,
                    TopP = 0.5,
                }
            };

            var promptTemplate = new PromptTemplate(
                skPrompt,                        // Prompt template defined in natural language
                promptConfig,                    // Prompt configuration
                kernel                           // SK instance
            );
            var functionConfig = new SemanticFunctionConfig(promptConfig, promptTemplate);
            var summaryFunction = kernel.RegisterSemanticFunction("MySkill", "Summary", functionConfig);

            var summary = await summaryFunction.InvokeAsync(chatRequest.request);

            if (summary.ErrorOccurred)
            {
                return StatusCode(500, summary.LastException.Message);
            }

            return Ok(new ChatResponse(summary.Result));
        }
    }
}

