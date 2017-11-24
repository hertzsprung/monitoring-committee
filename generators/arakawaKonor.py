from ninjaopenfoam import Case, GmtPlot, GmtPlotCopyCase, Gnuplot, PDFLaTeXFigure

import os

class ArakawaKonor:
    def __init__(self):
        self.lorenz = GmtPlotCopyCase(
                'arakawaKonor-horizontalGrading-lorenz',
                source='$atmostests_builddir',
                target='$builddir',
                plots=[
                    'src/mc-report-2017-12/theta_diff.gmtdict',
                    'src/mc-report-2017-12/theta_diffS.gmtdict'
                ],
                files=['0/theta_diff', '172800/theta_diff'])

        self.charneyPhillips = GmtPlotCopyCase(
                'arakawaKonor-horizontalGrading-cp',
                source='$atmostests_builddir',
                target='$builddir',
                plots=['src/mc-report-2017-12/theta_diffS.gmtdict'],
                files=['172800/theta_diff'])

        lorenzCase = Case('arakawaKonor-horizontalGrading-lorenz')
        charneyPhillipsCase = Case('arakawaKonor-horizontalGrading-cp')

        self.initialThetaDiff = GmtPlot(
            'arakawaKonor-initial-theta_diff',
            plot='theta_diff',
            case=lorenzCase,
            time=0,
            data=['0/theta_diff'],
            colorBar='legends/theta_diff.eps')

        self.lorenzThetaDiff = GmtPlot(
            'arakawaKonor-lorenz-theta_diff',
            plot='theta_diffS',
            case=lorenzCase,
            time=172800,
            data=['172800/theta_diff'])

        self.charneyPhillipsThetaDiff = GmtPlot(
            'arakawaKonor-cp-theta_diff',
            plot='theta_diffS',
            case=charneyPhillipsCase,
            time=172800,
            data=['172800/theta_diff'])

        self.thetaDiffFigure = PDFLaTeXFigure(
                'arakawaKonor-fig-thetaDiff',
                output=os.path.join('mc-report-2017-12/fig-arakawaKonor-thetaDiff'),
                figure=os.path.join('src/mc-report-2017-12/fig-arakawaKonor-thetaDiff'),
                components=self.initialThetaDiff.outputs() + \
                           self.lorenzThetaDiff.outputs() + \
                           self.charneyPhillipsThetaDiff.outputs()
        )

        self.conservation = Gnuplot(
                'arakawaKonor-conservation',
                output=os.path.join('mc-report-2017-12/arakawaKonor-conservation'),
                plot=os.path.join('src/mc-report-2017-12/arakawaKonor-conservation.plt'),
                data=[
                    '$atmostests_builddir/arakawaKonor-uniform-lorenz/energy.dat',
                    '$atmostests_builddir/arakawaKonor-uniform-cp/energy.dat',
                    '$atmostests_builddir/arakawaKonor-horizontalGrading-lorenz/energy.dat',
                    '$atmostests_builddir/arakawaKonor-horizontalGrading-cp/energy.dat',
                    '$atmostests_builddir/arakawaKonorAdvect-uniform-lorenz/energy.dat',
                    '$atmostests_builddir/arakawaKonorAdvect-uniform-cp/energy.dat',
                    '$atmostests_builddir/arakawaKonorAdvect-horizontalGrading-lorenz/energy.dat',
                    '$atmostests_builddir/arakawaKonorAdvect-horizontalGrading-cp/energy.dat'
                ]
        )

    def outputs(self):
        return self.thetaDiffFigure.outputs() + \
                self.conservation.outputs()

    def addTo(self, build):
        build.add(self.lorenz)
        build.add(self.charneyPhillips)
        build.add(self.initialThetaDiff)
        build.add(self.lorenzThetaDiff)
        build.add(self.charneyPhillipsThetaDiff)
        build.add(self.thetaDiffFigure)
        build.add(self.conservation)
