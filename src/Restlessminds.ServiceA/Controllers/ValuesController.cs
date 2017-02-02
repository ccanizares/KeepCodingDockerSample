using Microsoft.AspNetCore.Mvc;
using System.Runtime.InteropServices;

namespace Restlessminds.ServiceA.Controllers
{
    [Route("api/[controller]")]
    public class ValuesController : Controller
    {
        // GET api/values
        [HttpGet]
        public string Get()
        {
            return $"Response from ServiceA hosted on {RuntimeInformation.OSDescription}";
        }
    }
}
