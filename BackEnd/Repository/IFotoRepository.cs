using BackEnd.Model;

namespace BackEnd.Repository {
    public interface IFotoRepository
    {
        void salvar(Foto foto);
        void atualizar(Foto foto);
        void deletar(Foto foto);
        Foto recuperarPorUUID(string uuid);
        Foto[] recuperar();
    }
}