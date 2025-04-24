About htcondor-feedstock
========================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/htcondor-feedstock/blob/main/LICENSE.txt)


About htcondor
--------------

Home: http://htcondor.org/

Package license: Apache-2.0

Summary: HTCondor: High Throughput Computing

Development: https://github.com/htcondor/htcondor

Documentation: https://htcondor.readthedocs.io/

HTCondor is a workload management system for high-throughput and
high-performance jobs. Like other full-featured batch systems, HTCondor
provides a job queuing mechanism, scheduling policy, priority scheme,
resource monitoring, and resource management. Users submit their
serial or parallel jobs to HTCondor, HTCondor places them into a queue,
chooses when and where to run the jobs based upon a policy, carefully
monitors their progress, and ultimately informs the user upon
completion.


About htcondor-classads
-----------------------

Home: http://htcondor.org/

Package license: Apache-2.0

Summary: HTCondor's classified advertisement language

Development: https://github.com/htcondor/htcondor

Documentation: https://htcondor.readthedocs.io/

Classified Advertisements (classads) are the lingua franca of
HTCondor. They are used for describing jobs, workstations, and other
resources. They are exchanged by HTCondor processes to schedule
jobs. They are logged to files for statistical and debugging
purposes. They are used to enquire about current state of the system.

A classad is a mapping from attribute names to expressions. In the
simplest cases, the expressions are simple constants (integer,
floating point, or string). A classad is thus a form of property
list. Attribute expressions can also be more complicated. There is a
protocol for evaluating an attribute expression of a classad vis a vis
another ad. For example, the expression "other.size > 3" in one ad
evaluates to true if the other ad has an attribute named size and the
value of that attribute is (or evaluates to) an integer greater than
three. Two classads match if each ad has an attribute requirements
that evaluates to true in the context of the other ad. Classad
matching is used by the HTCondor central manager to determine the
compatibility of jobs and workstations where they may be run.


About libcondor_utils
---------------------

Home: http://htcondor.org/

Package license: Apache-2.0

Summary: HTCondor utilities library

Development: https://github.com/htcondor/htcondor

Documentation: https://htcondor.readthedocs.io/

Just the HTCondor libcondor_utils shared object library.

About python-htcondor
---------------------

Home: http://htcondor.org/

Package license: Apache-2.0

Summary: Python bindings for HTCondor

Development: https://github.com/htcondor/htcondor

Documentation: https://htcondor.readthedocs.io/

The HTCondor Python bindings aim to expose a high-quality,
Pythonic interface to the HTCondor client libraries. They utilize
the same C++ libraries as HTCondor itself, meaning they have
nearly the same behavior as the command line tools.


Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=8358&branchName=main">
            <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/htcondor-feedstock?branchName=main">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>linux_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=8358&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/htcondor-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_aarch64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=8358&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/htcondor-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_aarch64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_ppc64le</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=8358&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/htcondor-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_ppc64le_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=8358&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/htcondor-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=8358&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/htcondor-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-htcondor-green.svg)](https://anaconda.org/conda-forge/htcondor) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/htcondor.svg)](https://anaconda.org/conda-forge/htcondor) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/htcondor.svg)](https://anaconda.org/conda-forge/htcondor) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/htcondor.svg)](https://anaconda.org/conda-forge/htcondor) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-htcondor--classads-green.svg)](https://anaconda.org/conda-forge/htcondor-classads) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/htcondor-classads.svg)](https://anaconda.org/conda-forge/htcondor-classads) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/htcondor-classads.svg)](https://anaconda.org/conda-forge/htcondor-classads) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/htcondor-classads.svg)](https://anaconda.org/conda-forge/htcondor-classads) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-htcondor--utils-green.svg)](https://anaconda.org/conda-forge/htcondor-utils) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/htcondor-utils.svg)](https://anaconda.org/conda-forge/htcondor-utils) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/htcondor-utils.svg)](https://anaconda.org/conda-forge/htcondor-utils) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/htcondor-utils.svg)](https://anaconda.org/conda-forge/htcondor-utils) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-libcondor__utils-green.svg)](https://anaconda.org/conda-forge/libcondor_utils) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/libcondor_utils.svg)](https://anaconda.org/conda-forge/libcondor_utils) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/libcondor_utils.svg)](https://anaconda.org/conda-forge/libcondor_utils) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/libcondor_utils.svg)](https://anaconda.org/conda-forge/libcondor_utils) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-python--htcondor-green.svg)](https://anaconda.org/conda-forge/python-htcondor) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/python-htcondor.svg)](https://anaconda.org/conda-forge/python-htcondor) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/python-htcondor.svg)](https://anaconda.org/conda-forge/python-htcondor) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/python-htcondor.svg)](https://anaconda.org/conda-forge/python-htcondor) |

Installing htcondor
===================

Installing `htcondor` from the `conda-forge` channel can be achieved by adding `conda-forge` to your channels with:

```
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Once the `conda-forge` channel has been enabled, `htcondor, htcondor-classads, htcondor-utils, libcondor_utils, python-htcondor` can be installed with `conda`:

```
conda install htcondor htcondor-classads htcondor-utils libcondor_utils python-htcondor
```

or with `mamba`:

```
mamba install htcondor htcondor-classads htcondor-utils libcondor_utils python-htcondor
```

It is possible to list all of the versions of `htcondor` available on your platform with `conda`:

```
conda search htcondor --channel conda-forge
```

or with `mamba`:

```
mamba search htcondor --channel conda-forge
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search htcondor --channel conda-forge

# List packages depending on `htcondor`:
mamba repoquery whoneeds htcondor --channel conda-forge

# List dependencies of `htcondor`:
mamba repoquery depends htcondor --channel conda-forge
```


About conda-forge
=================

[![Powered by
NumFOCUS](https://img.shields.io/badge/powered%20by-NumFOCUS-orange.svg?style=flat&colorA=E1523D&colorB=007D8A)](https://numfocus.org)

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[Azure](https://azure.microsoft.com/en-us/services/devops/), [GitHub](https://github.com/),
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/),
[Drone](https://cloud.drone.io/welcome), and [TravisCI](https://travis-ci.com/)
it is possible to build and upload installable packages to the
[conda-forge](https://anaconda.org/conda-forge) [anaconda.org](https://anaconda.org/)
channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating htcondor-feedstock
===========================

If you would like to improve the htcondor recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/htcondor-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@duncanmmacleod](https://github.com/duncanmmacleod/)
* [@jasoncpatton](https://github.com/jasoncpatton/)
* [@timtheisen](https://github.com/timtheisen/)

