using System.Linq;
using BackEnd.Model;

namespace BackEnd.Repository.SQLite {
    public class SQLiteFotoRepository : IFotoRepository
    {
        private readonly EntityFrameworkFotoContext _context; 
        public SQLiteFotoRepository(EntityFrameworkFotoContext context)
        {
            _context = context;
        }
        public void salvar(Foto foto)
        {
            this._context.Fotos.Add(foto);
        }

        public void atualizar(Foto foto)
        {
            this._context.Fotos.Update(foto);
        }

        public void deletar(Foto foto)
        {
            this._context.Fotos.Remove(foto);
        }

        public Foto[] recuperar()
        {
            return this._context.Fotos.ToArray();
        }

        public Foto recuperarPorUUID(string uuid)
        {
            return this._context.Fotos.Where(x => x.uuid == uuid).FirstOrDefault();
        }
    }
}