using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CoPilotBackEnd.DataModels;
using CoPilotBackEnd.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.Orchestration;
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
        [Route("helloworld")]
        [Produces("application/json")]
        public async Task<ActionResult<ChatResponse>> HelloWorld([FromBody] ChatRequest chatRequest)
        {
            //TODO: Extract All this into a Service Pattern
            ChatResponse response = await Task.Run(() =>
            {
                return new ChatResponse(chatRequest.request + "is an interesting request.");
            });
            return Ok(response);
        }

        [HttpPost]
        [Route("hellocopilot")]
        [Produces("application/json")]
        public async Task<ActionResult<ChatResponse>> HelloCoPilot(
            [FromBody] ChatRequest chatRequest,
            [FromServices] ICoPilotService copilotService)
        {
            ChatResponse response = await copilotService.HelloWorld(chatRequest);
            return Ok(response);
        }

        [HttpPost]
        [Route("brainstorm")]
        [Produces("application/json")]
        public async Task<ActionResult<ChatResponse>> Brainstorm(
            [FromBody]ChatRequest chatRequest,
            [FromServices]ICoPilotService copilotService)
        {
            ChatResponse response = await copilotService.Brainstorm(chatRequest);
            return Ok(response);
        }
    }
}

