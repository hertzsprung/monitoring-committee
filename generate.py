#!/usr/bin/python3

import generators
from ninjaopenfoam import Build, PDFLaTeX, Shortcuts
import os

class MonitoringCommittee:
    def __init__(self):
        self.build = Build([
            'generators/arakawaKonor.py'
        ])

    def write(self):
        build = self.build

        arakawaKonor = generators.ArakawaKonor()

        report = PDFLaTeX(
                'report',
                output=os.path.join('mc-report-2017-12/mc-report-2017-12'),
                document=os.path.join('src/mc-report-2017-12/mc-report-2017-12'),
                components=[
                    'src/mc-report-2017-12/references.bib',
                    'src/mc-report-2017-12/tracer.tex',
                    'src/mc-report-2017-12/tracer.eps',
                    'src/mc-report-2017-12/convergence.tex',
                    'src/mc-report-2017-12/convergence.eps']
                    + arakawaKonor.outputs())

        shortcuts = Shortcuts([report.output])

        arakawaKonor.addTo(build)
        build.add(report)
        build.add(shortcuts)

        build.write()


if __name__ == '__main__':
    MonitoringCommittee().write()

