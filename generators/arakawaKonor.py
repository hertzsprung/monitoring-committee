from ninjaopenfoam import Case, GmtPlot, GmtPlotCopyCase

import os

class ArakawaKonor:
    def __init__(self):
        self.lorenz = GmtPlotCopyCase(
                'arakawaKonor-uniform-lorenz',
                source='$atmostests_builddir',
                target='$builddir',
                plots=['src/mc-report-2017-12/theta_diff.gmtdict'],
                files=['0/theta_diff', '172800/theta_diff'])

        self.charneyPhillips = GmtPlotCopyCase(
                'arakawaKonor-uniform-cp',
                source='$atmostests_builddir',
                target='$builddir',
                plots=['src/mc-report-2017-12/theta_diff.gmtdict'],
                files=['172800/theta_diff'])

        lorenzCase = Case('arakawaKonor-uniform-lorenz')
        charneyPhillipsCase = Case('arakawaKonor-uniform-cp')

        self.initialThetaDiff = GmtPlot(
            'arakawaKonor-initial-theta_diff',
            plot='theta_diff',
            case=lorenzCase,
            time=0,
            data=['0/theta_diff'])

        self.lorenzThetaDiff = GmtPlot(
            'arakawaKonor-lorenz-theta_diff',
            plot='theta_diff',
            case=lorenzCase,
            time=172800,
            data=['172800/theta_diff'])

        self.charneyPhillipsThetaDiff = GmtPlot(
            'arakawaKonor-cp-theta_diff',
            plot='theta_diff',
            case=charneyPhillipsCase,
            time=172800,
            data=['172800/theta_diff'])

    def outputs(self):
        return self.initialThetaDiff.outputs() + \
               self.lorenzThetaDiff.outputs() + \
               self.charneyPhillipsThetaDiff.outputs()

    def addTo(self, build):
        build.add(self.lorenz)
        build.add(self.charneyPhillips)
        build.add(self.initialThetaDiff)
        build.add(self.lorenzThetaDiff)
        build.add(self.charneyPhillipsThetaDiff)
