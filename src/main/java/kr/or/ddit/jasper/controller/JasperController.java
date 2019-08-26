package kr.or.ddit.jasper.controller;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lowagie.text.pdf.codec.Base64.InputStream;

import kr.or.ddit.category.post.post.model.PostVo;
import kr.or.ddit.matching.matching.service.IMatchingService;
import kr.or.ddit.matching.report.model.CoReportVo;
import kr.or.ddit.matching.report.model.ReportVo;
import kr.or.ddit.matching.report.service.IReportService;
import net.sf.jasperreports.engine.DefaultJasperReportsContext;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.ExporterInput;
import net.sf.jasperreports.export.OutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfExporterConfiguration;

@RequestMapping("/jasper")
@Controller
public class JasperController {

	private static final Logger logger = LoggerFactory.getLogger(JasperController.class);

	@Resource(name = "reportService")
	IReportService reportService;

	@RequestMapping(path = "/jasperView")
	public String index() {
		return "jasper/index";
	}

	@RequestMapping(path = "jasper", method = RequestMethod.POST)
	public void jasper(HttpServletResponse response, CoReportVo crv) throws Exception {

		logger.debug("☞crv:{}", crv);
		crv.setMem_id("ahri");
		int insertCnt = reportService.coReportInsert(crv);
		CoReportVo coReportVo = reportService.getLatestCoReport();
		logger.debug("☞insertCnt:{}", insertCnt);
		response.setContentType("text/html");
		Connection conn = ConnectionUtils.getConnection();
		HashMap<String, Object> param = new HashMap<String, Object>();
		int a = coReportVo.getReport_id();
//		reportService.getReportVo(mat_id)
		param.put("report_id",Integer.toString(a));

//		JRBeanCollectionDataSource datasource = new JRBeanCollectionDataSource(param);
		String report = "C:/Users/juenf/git/0819 1111/src/main/resources/matching.jrxml";
		java.io.InputStream inputStream = this.getClass().getResourceAsStream("/report/matching.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, param, conn);
		HtmlExporter htmlExporter = new HtmlExporter(DefaultJasperReportsContext.getInstance());
		htmlExporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		htmlExporter.setExporterOutput(new SimpleHtmlExporterOutput(response.getWriter()));
		htmlExporter.exportReport();
	}

	@RequestMapping(path = "/yaya")
	public void parameter() throws JRException, ClassNotFoundException, SQLException {

		String report = "C:/Users/juenf/git/0819 1111/src/main/resources/Blank_A4.jrxml";
		JasperReport jasperreport = JasperCompileManager.compileReport(report);
		Connection conn = ConnectionUtils.getConnection();
		HashMap<String, Object> param = new HashMap<String, Object>();
		JasperPrint print = JasperFillManager.fillReport(jasperreport, param, conn);

		File outDir = new File("C:/jasperoutput");
		outDir.mkdirs();

		JRPdfExporter exporter = new JRPdfExporter();

		ExporterInput exporterInput = new SimpleExporterInput(print);
		exporter.setExporterInput(exporterInput);
		OutputStreamExporterOutput exporterOutput = new SimpleOutputStreamExporterOutput(
				"C:/jasperoutput/FirstJasperReport.pdf");
		exporter.setExporterOutput(exporterOutput);
		SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
		exporter.setConfiguration(configuration);
		exporter.exportReport();

		logger.debug("☞Done!");

	}

	private static DataSource jasperDataSource;
	private static String jasperReportDir;

	public static void main(String[] args) throws JRException, ClassNotFoundException, SQLException {
		String report = "C:/Users/juenf/git/0819 1111/src/main/resources/matching.jrxml";
		JasperReport jasperreport = null;
		try {
			jasperreport = JasperCompileManager.compileReport(report);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Connection conn = ConnectionUtils.getConnection();
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("app_id", 1);
		JasperPrint print = null;
		try {
			print = JasperFillManager.fillReport(jasperreport, null, conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		File outDir = new File("C:/jasperoutput");
		outDir.mkdirs();
//
//		JRPdfExporter exporter = new JRPdfExporter();
//
//		ExporterInput exporterInput = new SimpleExporterInput(print);
//		exporter.setExporterInput(exporterInput);
//		OutputStreamExporterOutput exporterOutput = new SimpleOutputStreamExporterOutput(
//				"C:/jasperoutput/FirstJasperReport.pdf");
//		exporter.setExporterOutput(exporterOutput);
//		SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
//		exporter.setConfiguration(configuration);
//		exporter.exportReport();

		HtmlExporter exporter = new HtmlExporter();
		// Set input ...
		exporter.setExporterOutput(new SimpleHtmlExporterOutput("WEB-INF/view/index.html"));

		exporter.exportReport();

		logger.debug("☞Done!");

	}

	public void generateHtmlReport(String reportPath, String reportCode, String outputLocation,
			Map<String, Object> params) throws Exception {

	}

}
