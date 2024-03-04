package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Persistence.GenericDao;
import Persistence.MotoristaDao;
import Persistence.OnibusDao;
import Persistence.ViagemDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Motorista;
import model.Onibus;
import model.Viagem;

@WebServlet("/viagem")
public class ViagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViagemServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String erro = "";
		List<Motorista> motoristas = new ArrayList<>();
		
		GenericDao gDao = new GenericDao();
		MotoristaDao mDao = new MotoristaDao(gDao);
		
		List<Onibus> busoes = new ArrayList<>();
		OnibusDao oDao = new OnibusDao(gDao);
		
		try {
			motoristas = mDao.listar();
			busoes = oDao.listar();
		} catch (SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		}finally {
			request.setAttribute("erro", erro);
			request.setAttribute("motoristas", motoristas);
			request.setAttribute("busoes", busoes);
			RequestDispatcher rd = request.getRequestDispatcher("viagem.jsp");
			rd.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Entrada
				String cmd = request.getParameter("botao");
				String codigo = request.getParameter("codigo");
				String motorista = request.getParameter("motorista");
				String onibus = request.getParameter("onibus");
				String saida = request.getParameter("hora_saida");
				String chegada = request.getParameter("hora_chegada");
				String partida = request.getParameter("partida");
				String destino = request.getParameter("destino");

				
				// Retorno
				String msgSaida = "";
				String erro = "";
				Viagem v = new Viagem();
				List<Viagem> viagens = new ArrayList<>();
				List<Motorista> motoristas = new ArrayList<>();
				List<Onibus> busoes = new ArrayList<>();


				if (!cmd.contains("Listar")) {
					v.setCodigo(Integer.parseInt(codigo));
				}
				if (cmd.contains("Cadastrar") || cmd.contains("Alterar")) {
					Onibus o = new Onibus();
					Motorista m = new Motorista();
					o.setPlaca(onibus);
					m.setCodigo(Integer.parseInt(motorista));
					v.setMotorista(m);
					v.setOnibus(o);
					v.setHora_saida(Integer.parseInt(saida));
					v.setHora_chegada(Integer.parseInt(chegada));
					v.setPartida(partida);
					v.setDestino(destino);
				}

				try {
					if (cmd.contains("Cadastrar")) {
						cadastrarViagem(v);
						saida = "Viagem Cadastrada com sucesso";
						v = null;
					}
					if (cmd.contains("Alterar")) {
						alterarViagem(v);
						saida = "Viagem Atualizada com sucesso";
						v = null;
					}
					if (cmd.contains("Excluir")) {
						excluirViagem(v);
						saida = "Viagem Excluida com sucesso";
						v = null;
					}
					if (cmd.contains("Buscar")) {
						v = buscarViagem(v);
					}
					if (cmd.contains("Listar")) {
						viagens = listarViagens();
					}
					if (cmd.contains("Desc. Onibus")) {
						v = descOnibus(v);
					}
					if (cmd.contains("Desc. Viagem")) {
						v = descViagem(v);
					}
				} catch (SQLException | ClassNotFoundException e) {
					erro = e.getMessage();
				} finally {
					request.setAttribute("saida", msgSaida);
					request.setAttribute("erro", erro);
					request.setAttribute("viagem", v);
					request.setAttribute("viagens", viagens);
					request.setAttribute("motoristas", motoristas);
					request.setAttribute("busoes", busoes);

					RequestDispatcher rd = request.getRequestDispatcher("viagem.jsp");
					rd.forward(request, response);
				}
			}

	private void cadastrarViagem(Viagem v) throws SQLException, ClassNotFoundException {
		GenericDao gDao = new GenericDao();
		ViagemDao vDao = new ViagemDao(gDao);
		vDao.inserir(v);
	}

	private void alterarViagem(Viagem v) throws SQLException, ClassNotFoundException {
		GenericDao gDao = new GenericDao();
		ViagemDao vDao = new ViagemDao(gDao);
		vDao.atualizar(v);
	}

	private void excluirViagem(Viagem v) throws SQLException, ClassNotFoundException {
		GenericDao gDao = new GenericDao();
		ViagemDao vDao = new ViagemDao(gDao);
		vDao.excluir(v);
	}

	private Viagem buscarViagem(Viagem v) throws SQLException, ClassNotFoundException {
		GenericDao gDao = new GenericDao();
		ViagemDao vDao = new ViagemDao(gDao);
		v = vDao.consultar(v);
		return v;
	}

	private List<Viagem> listarViagens() throws SQLException, ClassNotFoundException {
		GenericDao gDao = new GenericDao();
		ViagemDao vDao = new ViagemDao(gDao);
		List<Viagem> viagens = vDao.listar();
		return viagens;
	}

	private Viagem descOnibus(Viagem v) throws SQLException, ClassNotFoundException {
		GenericDao gDao = new GenericDao();
		ViagemDao vDao = new ViagemDao(gDao);
		v = vDao.descriscao_onibus(v);
		return v;
	}

	private Viagem descViagem(Viagem v) throws SQLException, ClassNotFoundException {
		GenericDao gDao = new GenericDao();
		ViagemDao vDao = new ViagemDao(gDao);
		v = vDao.descriscao_viagem(v);
		return v;
	}

			
}
