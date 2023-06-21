using System;
namespace CoPilotBackEnd.DataModels
{
    public class ChatResponse
    {
        public String Response { get; set; }

        public ChatResponse(String response)
        {
            this.Response = response;
        }
    }
}

