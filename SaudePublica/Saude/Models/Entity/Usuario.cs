using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Saude.Models.Entity
{
	[Table("Usuario")]
	public class Usuario
	{
		public int Id { get; set; }

		[Required(ErrorMessage = "Login é obrigatório")]
		[MaxLength(45, ErrorMessage = "Campo deve conter no máximo 45 caracteres")]
		[RegularExpression(@"^[a-z0-9]*$", ErrorMessage = "Login deve conter apenas letras minúsculas e números")]
		public string Login { get; set; }

		[Required(ErrorMessage = "Senha é obrigatória")]
		[MaxLength(45, ErrorMessage = "Campo deve conter no máximo 45 caracteres")]
		public string Senha { get; set; }

		[MaxLength(45, ErrorMessage = "Campo deve conter no máximo 45 caracteres")]
		[RegularExpression(@"^[^@\s]+@[^@\s\.]+\.[^@\.\s]+$", ErrorMessage = "Favor informar um email válido")]
		public string Email { get; set; }

		[Required(ErrorMessage = "Perfil de acesso é obrigatório")]
		[DisplayName("Perfil de acesso")]
		public int Perfil_Acesso_Id { get; set; }
	}
}
