package com.ui;

import java.util.ArrayList;
import java.util.List;

import com.core.TableSet;
import com.github.appreciated.apexcharts.ApexCharts;
import com.github.appreciated.apexcharts.config.builder.ChartBuilder;
import com.github.appreciated.apexcharts.config.builder.LegendBuilder;
import com.github.appreciated.apexcharts.config.builder.ResponsiveBuilder;
import com.github.appreciated.apexcharts.config.chart.Type;
import com.github.appreciated.apexcharts.config.legend.Position;
import com.github.appreciated.apexcharts.config.responsive.builder.OptionsBuilder;
import com.vaadin.flow.component.html.Div;

/**
 * TriceraPieChart
 */
public class TriceraPieChart extends Div {

    public TriceraPieChart(){
        super();
    }

    public TriceraPieChart(List<TableSet> tableSet) {
        ArrayList<String> col1 = new ArrayList<>();
        ArrayList<Double> col2 = new ArrayList<>();
        try {
            for(TableSet row : tableSet){
                col1.add((row.getCol1().isEmpty() ? "blank" : row.getCol1()));
                col2.add((row.getCol2().isEmpty() ? 0.0 : Double.parseDouble(row.getCol2()))); //typically second column is float
            }
            ApexCharts pieChart = new ApexCharts()
                .withChart(ChartBuilder.get().withType(Type.pie).build())
                .withLabels(col1.toArray(new String[0]))
                .withLegend(LegendBuilder.get()
                    .withPosition(Position.right)
                    .build())
                .withSeries(col2.toArray(new Double[0]))
                .withResponsive(ResponsiveBuilder.get()
                        .withBreakpoint(480.0)
                        .withOptions(OptionsBuilder.get()
                                .withLegend(LegendBuilder.get()
                                        .withPosition(Position.bottom)
                                        .build())
                                .build())
                        .build());
            add(pieChart);
            setWidth("80%");
            setMaxWidth("600px");
        } catch (Exception e) {
            System.out.println("### TriceraPieChart.constructor() : Exception = " + e.toString());
        }
        
        
    }

    
}