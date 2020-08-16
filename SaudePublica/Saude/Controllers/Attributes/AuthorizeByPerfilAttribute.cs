using System.Linq;
using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using Saude.Models.Enums;

namespace Saude.Controllers.Attributes
{
	public class AuthorizeByPerfilAttribute : TypeFilterAttribute
	{
		public AuthorizeByPerfilAttribute(params PerfilAcessoEnum[] perfis) : base(typeof(ClaimRequirementFilter))
		{
			Arguments = new object[]
			{
				perfis.Select(x => new Claim(ClaimTypes.Role, ((int) x).ToString())).ToArray()
			};
		}
	}
}
