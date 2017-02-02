using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Logging;
using System.Net.Http;

namespace Restlessminds.web.Controllers
{
    public class HomeController : Controller
    {
        private readonly IOptions<AppSettings> _settings;
        private readonly ILogger _logger;

        public HomeController(IOptions<AppSettings> settings, ILogger<HomeController> logger)
        {
            _settings = settings;
            _logger = logger;

            if (logger.IsEnabled(LogLevel.Debug))
                logger.LogInformation($"Home controller with settings: A: {settings.Value.ServiceAUrl}, B: {settings.Value.ServiceBUrl}");
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> A()
        {
            var client = new HttpClient();

            var serviceAUrl = $"{_settings.Value.ServiceAUrl}/api/values";
            var dataString = await client.GetStringAsync(serviceAUrl);
            ViewBag.Data = dataString;

            return View();
        }

        public async Task<IActionResult> B()
        {
            var client = new HttpClient();

            var serviceBUrl = $"{_settings.Value.ServiceBUrl}/api/values"; 
            var dataString = await client.GetStringAsync(serviceBUrl);
            ViewBag.Data = dataString;

            return View();
        }
    }
}
