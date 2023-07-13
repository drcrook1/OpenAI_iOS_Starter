using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CoPilotBackEnd.DataModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.SemanticFunctions;
using Microsoft.SemanticKernel.SkillDefinition;

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

            ISKFunction brainstormingAgent = kernel.Skills.GetFunction("TravelAgentSkill", "BrainStorm");
            var context = kernel.CreateNewContext();
            context["input"] = chatRequest.request;
            context["history"] = "User: I have a dog and two children who need to travel with me.";

            var result = await brainstormingAgent.InvokeAsync(context);

            if (result.ErrorOccurred)
            {
                return StatusCode(500, result.LastException.Message);
            }

            return Ok(new ChatResponse(result.Result));
        }
    }
}

