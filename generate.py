#!/usr/bin/python3

from ninjaopenfoam import Build, PDFLaTeX, Shortcuts
import os

class MonitoringCommittee:
    def __init__(self):
        self.build = Build()

    def write(self):
        build = self.build

        report = PDFLaTeX(
                'report',
                output=os.path.join('mc-report-2017-12/mc-report-2017-12'),
                document=os.path.join('src/mc-report-2017-12/mc-report-2017-12'),
                components=['src/mc-report-2017-12/references.bib'])

        shortcuts = Shortcuts([report.output])

        build.add(report)
        build.add(shortcuts)

        build.write()


if __name__ == '__main__':
    MonitoringCommittee().write()

