using Application.DTOs.SupportTicket;
using Application.Features.SupportTicket;
using Application;
using Application.Interfaces;
using Domain.Settings;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Threading.Tasks;

namespace WebAPI.Controllers
{
    [Route("Description")]
    public class TicketDescriptionController : BaseApiController
    {
        APISettings _settings;
        protected readonly IEncryptDecrypt _encryptDecrypt;

        public TicketDescriptionController(IOptions<APISettings> settings, IEncryptDecrypt encryptDecrypt)
        {
            _settings = settings.Value;
            _encryptDecrypt = encryptDecrypt;
        }

        [HttpPost("TicketDescription")]
        public async Task<IActionResult> TicketDescription([FromBody] SupportTicketDTO supportTicketDTO)
        {
            TicketList response = new TicketList();


            response = await mediator.Send(new TicketDescriptionCommand
            {
                supportTicketDTO = supportTicketDTO
            });

            if (response == null)
                return Ok(APIResponse<string>.Unauthorized("Please check login credentials"));

            return Ok(response);
        }
    }
}
