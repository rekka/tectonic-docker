sizes = [r'\tiny',
r'\scriptsize',
r'\footnotesize',
r'\small',
r'\normalsize',
r'\large',
r'\Large',
r'\LARGE',
r'\huge',
r'\Huge']

styles = [r'\textnormal',
r'\emph',
r'\textrm',
r'\textsf',
r'\texttt',
r'\textup',
r'\textit',
r'\textsl',
r'\textsc',
r'\uppercase',
r'\textbf',
]

classes = ['amsart', 'article', 'beamer']
document_sizes = ['10pt', '11pt', '12pt']

for cls in classes:
    for ds in document_sizes:
        with open('{}_{}.tex'.format(cls, ds), 'w') as f:
            f.write('\\documentclass[{}]{{{}}}\n'.format(ds, cls))
            f.write('\\begin{document}\n')
            for size in sizes:
                for style in styles:
                    f.write('{}{}{{Sample text}}\n'.format(size, style))
            f.write('\\end{document}\n')
