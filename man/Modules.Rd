% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pythonInterface.R
\name{Modules}
\alias{Modules}
\alias{pythonImport}
\alias{pythonAddToPath}
\title{Import a Python module or add a directory to the Python Search Path}
\usage{
pythonImport(..., evaluator, where = topenv(parent.frame()))

pythonAddToPath(directory = "python",
  package = utils::packageName(topenv(parent.frame())), pos = NA, evaluator,
  where = topenv(parent.frame()))
}
\arguments{
\item{..., where}{arguments for the \code{$Import()} method. See the method documentation for details.}

\item{evaluator}{The evaluator object to use. Supplying this argument suppresses the load action.}

\item{directory}{the directory to add, defaults to "python"}

\item{package, pos}{arguments \code{package} and \code{pos} to the method, usually omitted.}
}
\description{
If called from the source directory of a package during installation, both \code{pythonImport}
and \code{pythonAddToPath()} also set up
a load action for that package.  The functional versions, not the methods themselves, should
be called from package source files to ensure that the load actions are created.
}
\section{Functions}{
\itemize{
\item \code{pythonImport}: Add the module and name information specified to the objects imported for Python evaluators.

\item \code{pythonAddToPath}: Add the directory specified to the search path for future Python objects.
}}

\examples{
\dontrun{
## How to search from a local directory, import a function from a file there
## and call the function.
## Including the evaluator argument causes the path change and import to happen
## right now, not in a package being loaded
ev <- RPython()
pythonAddToPath("/Users/me/myPython/", package = "",
                evaluator = ev)
pythonImport("funEx", "foo", evaluator = ev)
pythonCall("foo", 1.1, 1.2)
}
}
