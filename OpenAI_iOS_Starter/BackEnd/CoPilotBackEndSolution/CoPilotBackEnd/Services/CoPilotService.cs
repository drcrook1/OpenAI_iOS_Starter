using System;
using CoPilotBackEnd.DataModels;
using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.Orchestration;
using Microsoft.SemanticKernel.SkillDefinition;

namespace CoPilotBackEnd.Services
{
	public class CoPilotService : ICoPilotService
	{

        SKContext Context;
        ISKFunction BrainstormingAgent;

		public CoPilotService(IKernel kernel)
		{
            BrainstormingAgent = kernel.Skills.GetFunction("TravelAgentSkill", "BrainStorm");
            Context = kernel.CreateNewContext();
        }

        public async Task<ChatResponse> Brainstorm(ChatRequest chatRequest)
        {
            Context["input"] = chatRequest.request;
            Context["history"] = chatRequest.history;

            //Do your grounding by reaching out to additional Services Here

            //Do all your fancy Semantic Kernel stuff here.

            SKContext result = await BrainstormingAgent.InvokeAsync(Context);

            if (result.ErrorOccurred)
            {
                throw new Exception("Error Invoking Semantic Kernel.");
            }

            return new ChatResponse(result.Result);
        }

        public async Task<ChatResponse> HelloWorld(ChatRequest request)
        {
            ChatResponse response = await Task.Run(() =>
            {
                return new ChatResponse(request.request + "is an interesting request.");
            });
            return response;
        }
    }
}

