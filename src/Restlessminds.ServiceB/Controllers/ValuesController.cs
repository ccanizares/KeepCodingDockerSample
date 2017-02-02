using Microsoft.AspNetCore.Mvc;
using System.Runtime.InteropServices;

namespace Restlessminds.ServiceB.Controllers
{
    [Route("api/[controller]")]
    public class ValuesController : Controller
    {
        // GET api/values
        [HttpGet]
        public string Get()
        {
            return $"Response from ServiceB hosted on {RuntimeInformation.OSDescription}";
        }
    }
}
