using System;
using CoPilotBackEnd.DataModels;

namespace CoPilotBackEnd.Services
{
	public interface ICoPilotService
	{
		public abstract Task<ChatResponse> Brainstorm(ChatRequest request);
		public abstract Task<ChatResponse> HelloWorld(ChatRequest request);
	}
}

