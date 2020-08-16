using System.Linq;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Saude.Controllers.Attributes
{
	public class ClaimRequirementFilter : IAuthorizationFilter
	{
		readonly Claim[] _claimArray;

		public ClaimRequirementFilter(Claim[] claimArray)
		{
			_claimArray = claimArray;
		}

		public void OnAuthorization(AuthorizationFilterContext context)
		{
			bool hasAllowAnonymous = context.ActionDescriptor.EndpointMetadata.Any(em => em.GetType() == typeof(AllowAnonymousAttribute));

			if (hasAllowAnonymous)
			{
				return;
			}

			var hasClaim = context.HttpContext.User.Claims.Any(c => _claimArray.Any(x => x.Type == c.Type && x.Value == c.Value));
			if (!hasClaim)
			{
				context.Result = new ForbidResult();
			}
		}
	}
}
