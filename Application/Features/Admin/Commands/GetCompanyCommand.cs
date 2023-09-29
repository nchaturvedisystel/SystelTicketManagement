using Application.DTOs.Admin;
using Application.Interfaces.Admin;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.Admin.Commands
{
    public class GetCompanyCommand : IRequest<CompanyList>
    {
    }
    internal class CompanyHandler : IRequestHandler<GetCompanyCommand, CompanyList>
    {
        protected readonly ICompany _Company;

        public CompanyHandler(ICompany Company)
        {
            _Company = Company;
        }
        public async Task<CompanyList> Handle(GetCompanyCommand request, CancellationToken cancellationToken)
        {
            return await _Company.GetCompany();
        }
    }
}

