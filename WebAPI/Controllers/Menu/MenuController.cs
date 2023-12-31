﻿using Application.DTOs;
using Application.Features.Shipments.Commands;
using Application;
using Application.Interfaces;
using Domain.Settings;
using DTO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Threading.Tasks;
using Application.Features.Menus.Commands;
using WebAPI.Authorization;
using Application.DTOs.SupportTicket;
using Application.Features.SupportTicket;

namespace WebAPI.Controllers.Menu
{
    [Route("menus")]
    //[AuthorizeUser]
    public class MenuController : BaseApiController
    {
        APISettings _settings;
        protected readonly IEncryptDecrypt _encryptDecrypt;

        public MenuController(IOptions<APISettings> settings, IEncryptDecrypt encryptDecrypt)
        {
            _settings = settings.Value;
            _encryptDecrypt = encryptDecrypt;
        }
        [HttpPost("GetMenuForUser")]
        public async Task<IActionResult> GetMenuForUser([FromBody] MenuMasterDTO menuMasterDTO, [FromHeader] string Authorization)
        {

            MenuMasterList response = await mediator.Send(new MenuMasterCommand
            {
                UserId = menuMasterDTO.UserId
            });

            if (response == null)
                return Ok(APIResponse<string>.Unauthorized("Please check login credentials"));

            return Ok(response);
        }

        [HttpPost("GetClientWorkList")]
        public async Task<IActionResult> GetClientWorkList([FromBody] SupportTicketDTO supportTicketDTO)
        {
            ClientWorkList response = new ClientWorkList();


            response = await mediator.Send(new ClientWorkListCommand
            {
                supportTicketDTO = supportTicketDTO
            });

            if (response == null)
                return Ok(APIResponse<string>.Unauthorized("Please check login credentials"));

            return Ok(response);
        }

        [HttpPost("GetTicketResolverList")]
        public async Task<IActionResult> GetTicketResolverList([FromBody] SupportTicketDTO supportTicketDTO)
        {
            TicketList response = new TicketList();


            response = await mediator.Send(new TicketResolverListCommand
            {
                supportTicketDTO = supportTicketDTO
            });

            if (response == null)
                return Ok(APIResponse<string>.Unauthorized("Please check login credentials"));

            return Ok(response);
        }
    }
}
