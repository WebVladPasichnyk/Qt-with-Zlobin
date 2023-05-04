#include <iostream>
#include <QApplication>
#include <QFile>
#include <QTextStream>
#include <cmath>
#include <qwt_plot.h>
#include <qwt_plot_curve.h>
#include <QPen>
#include <fstream>

double sygn(float t)
{
    double s;
    float T = 0.03;

    if (t == 0)
        s = 0;
    else if ((t > 0) && (t <= T / 4))
        s = 5 * t / (T / 4);
    else if ((t > T / 4) && (t <= 0.75 * T))
        s = 5 - 15 * (t - T / 4) / (0.75 * T);
    else if ((t > 0.75 * T) && (t <= T))
        s = 5 * t / (T / 4) - 20;
    else if (t == T)
        s = 0;

    return s;
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    const float T = 0.03;
    const int N = 200;
    int i;
    double w = (2 * 3.14159) / T;
    float h = T / N;
    double t[N], s[N];
    for (i = 0; i < N; i++)
    {
        t[i] = i * h;
        s[i] = sygn(t[i]);
    }

    QwtPlot plot;
    plot.setTitle("Signal");
    plot.setCanvasBackground(Qt::white);

    QwtPlotCurve *curve = new QwtPlotCurve();
    curve->setPen(QPen(Qt::blue));
    curve->setSamples(t, s, N);
    curve->attach(&plot);

    plot.resize(600, 400);
    plot.show();

    return app.exec();
}


