using Application.DTOs;
using Application.Features.Menus.Commands;
using Application;
using Application.Interfaces;
using Domain.Settings;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Threading.Tasks;
using WebAPI.Authorization;
using Application.DTOs.SupportTicket;
using Application.Features.SupportTicket;
using Application.DTOs.Admin;
using MediatR;

namespace WebAPI.Controllers.SupportTicket
{
    [Route("Ticket")]
    //[AuthorizeUser]
    public class TicketController : BaseApiController
    {
        APISettings _settings;
        protected readonly IEncryptDecrypt _encryptDecrypt;

        public TicketController(IOptions<APISettings> settings, IEncryptDecrypt encryptDecrypt)
        {
            _settings = settings.Value;
            _encryptDecrypt = encryptDecrypt;
        }

        [HttpPost("ManageTicket")]
        public async Task<IActionResult> ManageTicket([FromBody] SupportTicketDTO supportTicketDTO)
        {
            TicketList response = new TicketList();


            response = await mediator.Send(new SupportTicketCommand
            {
                supportTicketDTO = supportTicketDTO
            }) ;

            if (response == null)
                return Ok(APIResponse<string>.Unauthorized("Please check login credentials"));

            return Ok(response);
        }
        [HttpPost("ClientUserTicketList")]
        public async Task<IActionResult> ClientUserTicketList([FromBody] SupportTicketDTO supportTicketDTO)
        {
            ClientUserTicketList response = new ClientUserTicketList();


            response = await mediator.Send(new ClientUserTicketListCommand
            {
                supportTicketDTO = supportTicketDTO
            });

            if (response == null)
                return Ok(APIResponse<string>.Unauthorized("Please check login credentials"));

            return Ok(response);
        }

        [HttpPost("TicketDetails")]
        public async Task<IActionResult> TicketDetails([FromBody] SupportTicketDTO supportTicketDTO)
        {
            TicketList response = new TicketList();


            response = await mediator.Send(new TicketDetailsCommand
            {
                supportTicketDTO = supportTicketDTO
            });

            if (response == null)
                return Ok(APIResponse<string>.Unauthorized("Please check login credentials"));

            return Ok(response);
        }
    }
}
