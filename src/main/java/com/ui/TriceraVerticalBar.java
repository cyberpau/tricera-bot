package com.ui;

import java.util.ArrayList;
import java.util.List;

import com.core.TableSet;
import com.github.appreciated.apexcharts.ApexCharts;
import com.github.appreciated.apexcharts.config.builder.ChartBuilder;
import com.github.appreciated.apexcharts.config.builder.DataLabelsBuilder;
import com.github.appreciated.apexcharts.config.builder.FillBuilder;
import com.github.appreciated.apexcharts.config.builder.PlotOptionsBuilder;
import com.github.appreciated.apexcharts.config.builder.StrokeBuilder;
import com.github.appreciated.apexcharts.config.builder.TooltipBuilder;
import com.github.appreciated.apexcharts.config.builder.XAxisBuilder;
import com.github.appreciated.apexcharts.config.builder.YAxisBuilder;
import com.github.appreciated.apexcharts.config.chart.Type;
import com.github.appreciated.apexcharts.config.plotoptions.builder.BarBuilder;
import com.github.appreciated.apexcharts.config.tooltip.builder.YBuilder;
import com.github.appreciated.apexcharts.config.yaxis.builder.TitleBuilder;
import com.github.appreciated.apexcharts.helper.Series;
import com.vaadin.flow.component.html.Div;

/**
 * TriceraVerticalBar
 */
public class TriceraVerticalBar extends Div {

    public TriceraVerticalBar(){
        super();
    }

    public TriceraVerticalBar(List<TableSet> tableSet) {
        ArrayList<String> col1 = new ArrayList<>();
        ArrayList<Double> col2 = new ArrayList<>();
        try {
            for(TableSet row : tableSet){
                col1.add((row.getCol1().isEmpty() ? "blank" : row.getCol1()));
                col2.add((row.getCol2().isEmpty() ? 0.0 : Double.parseDouble(row.getCol2()))); //typically second column is float
            }
            ApexCharts barChart = new ApexCharts()
                .withChart(ChartBuilder.get()
                        .withType(Type.bar)
                        .build())
                .withPlotOptions(PlotOptionsBuilder.get()
                        .withBar(BarBuilder.get()
                                .withHorizontal(false)
                                .withColumnWidth("55%")
                                .build())
                        .build())
                .withDataLabels(DataLabelsBuilder.get()
                        .withEnabled(false).build())
                .withStroke(StrokeBuilder.get()
                        .withShow(true)
                        .withWidth(2.0)
                        .withColors("transparent")
                        .build())
                .withSeries(new Series("COLUMN 2", col2.toArray(new Double[0])))
                .withYaxis(YAxisBuilder.get()
                        .withTitle(TitleBuilder.get()
                                .withText("COLUMN 2")
                                .build())
                        .build())
                .withXaxis(XAxisBuilder.get().withCategories(col1.toArray(new String[0])).build())
                .withFill(FillBuilder.get()
                        .withOpacity(1.0).build())
                .withTooltip(TooltipBuilder.get()
                        .withY(YBuilder.get()
                                .withFormatter("function (val) {\n" + // Formatter currently not yet working
                                        "return \"$ \" + val + \" thousands\"\n" +
                                        "}").build())
                        .build());
            add(barChart);
            setWidth("80%");
        } catch (Exception e) {
            System.out.println("### TriceraPieChart.constructor() : Exception = " + e.toString());
        }
        
        
    }

    
}