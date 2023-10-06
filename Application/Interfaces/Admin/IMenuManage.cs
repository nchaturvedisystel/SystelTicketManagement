using Application.DTOs.Admin;
using Application.DTOs.SupportTicket;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Admin
{
    public interface IMenuManage
    {
        public Task<MenuManageList> ManageMenu(MenuManageDTO menuManageDTO);
        public Task<AdminDashboardList> AdminDashboardGet(int actionUser);
        public Task<ClientWorkList> SupportTicket_TicketWorkList(SupportTicketDTO supportTicketDTO);

    }
}
