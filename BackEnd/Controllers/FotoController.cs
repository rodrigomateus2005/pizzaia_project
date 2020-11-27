using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BackEnd.Model;
using BackEnd.Repository;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FotoController : ControllerBase
    {

        private readonly IFotoRepository _repositorio;
        private readonly IHostingEnvironment _hostingEnvironment;

        public FotoController(IHostingEnvironment hostingEnvironment, IFotoRepository repositorio)
        {
            _repositorio = repositorio;
            _hostingEnvironment = hostingEnvironment;
        }

        [HttpGet("CheckOnline")]
        public ActionResult<bool> CheckOnline()
        {
            return Ok(true);
        }

        [HttpGet]
        public ActionResult<IEnumerable<Foto>> Get()
        {
            return this._repositorio.recuperar();
        }

        [HttpGet("{uuid}.png")]
        public ActionResult<string> Get(string uuid)
        {
            if (!System.IO.File.Exists(this.pathFoto(uuid))) return NotFound();

            return File(System.IO.File.Open(this.pathFoto(uuid), System.IO.FileMode.Open), "image/png");
        }

        [HttpPost]
        public void Post([FromForm] string uuid, [FromForm] bool favorita, [FromForm] IFormFile arquivo)
        {
            Foto foto = new Foto();
            foto.uuid = uuid;
            foto.favorita = favorita;
            this._repositorio.salvar(foto);
            if (!System.IO.Directory.Exists(this.directoryFoto()))
            {
                System.IO.Directory.CreateDirectory(this.directoryFoto());
            }
            using (System.IO.Stream s = System.IO.File.Open(this.pathFoto(uuid), System.IO.FileMode.OpenOrCreate))
            {
                arquivo.CopyTo(s);
                s.Close();
            }

        }

        [HttpPut("{uuid}")]
        public void Put(string uuid, [FromBody] bool favorito)
        {
            Foto foto = this._repositorio.recuperarPorUUID(uuid);
            if (foto != null)
            {
                foto.favorita = favorito;
                this._repositorio.atualizar(foto);
            }
        }

        [HttpDelete("{uuid}")]
        public void Delete(string uuid)
        {
            Foto foto = this._repositorio.recuperarPorUUID(uuid);
            if (foto != null)
            {
                this._repositorio.deletar(foto);
            }
        }

        private string directoryFoto()
        {
            string pathBase;
#if DEBUG
            pathBase = this._hostingEnvironment.ContentRootPath;
#else
            pathBase = this._hostingEnvironment.WebRootPath;
#endif
            return System.IO.Path.Combine(pathBase, "Fotos");
        }

        private string pathFoto(string uuid)
        {
            return System.IO.Path.Combine(this.directoryFoto(), $"{uuid}.png");
        }
    }
}
