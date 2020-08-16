using System.IO;

namespace Saude.Services
{
	public class CodigoInternacionalDoencasService
	{
		public FileStream GetCodigoInternacionalDoencas()
		{
			return File.Open("Files/cid.pdf", FileMode.Open);
		}
	}
}
