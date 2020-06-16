# Course design components for *RSE in R*

## Basic design components

These are to develop a compass for developing and structuring the material.
Many may have a strong focus on "in class" etc, 
but this is to give a direction on how to write those sections
(e.g. having the perspective that an instructor will be reading these sections).

- **Learning outcome/goal**: Ultimately, to be able to create an R package, that:
    - Passes checks and requirements to (potentially) be submitted to CRAN
    - Incorporates best practices in package development 
    (unit testing, continuous integration, version control)
    - Is designed to involve the community, such as gaining potential contributors
    (including licensing, code of conduct, contributing guidelines, 
    well described README)
    - Has user-friendly (i.e. targetted to a novice to intermediate user)
    documentation and tutorials on how to use the package (e.g. a nice website)
    - Is adequately structured to make package management and maintanence easier
    (e.g. with Issue Templates, Project Boards, Labels, contributing guidelines)
    
- **Teaching/learning activities**:
    - In class portion: 
        - Some lectures for those material that aren't coding heavily
        (e.g. for lessons to involve community, being a good community member)
        - Live coding (with instructor)
        - Exercises that expand on material covered with instructor that 
        solve a provided problem, with or without scaffolding
    - Out of class: 
        - Group work/project creating an R package based on a set of (given?) problems
        - Formative assessments like coding with immediate feedback on correct/incorrect
        (via learnr package? Esp with new update to RStudio in version 1.3)
        - Reading assignments?

- **Assessment and feedback activities**:
    - Deadlines for milestones to acheive for project, with instructor feedback on progress
    - Out-of-class formative assessments based on maybe learnr tutorials?
    - After completing in-class exercises, go over them as class?
    - Peer review activities? E.g. exercises that have a rubric that go with them that can be used to guide peer review.

- Key resources to use for this:
  - R packages: usethis, devtools, drake?, pkgdown, testthat, styler, rmarkdown
  - Online books: [R Packages](https://r-pkgs.org/) 
  (we differentiate from this amazing book by structuring everything around 
  this being a course, with exercises, assessments, (group?) projects, 
  instructions/comments/notes for instructors, etc)

## Chapter outline

Course chapters and content need to be strongly aligned with learning outcome/goal.
Here is a draft outline to guide development.

- Syllabus
    - Overview of course
    - Why to learn it
    - What makes this course different

- Folder and file structure (RStudio R Projects)
    - Filepaths, very basics of the shell (in RStudio)
    - Making use of the fs package for filesystem management
    
- Setting up an R package
    - Using devtools, usethis for development
        - e.g. `use_devtools()` and `use_usethis()`.
    - Developing functions
    - Making and using datasets

- Function development in a package environment
    - Dependency management
    - Function documentation (with roxygen2), part 1
        - To use `@examples` to help with creating function

- (Idea) Additional features to make use of
    - RStudio addins, snippets, rmarkdown templates, templates
    - rstudioapi?

- Version control: Using Git and GitHub as a sole user (part 1)
    - Using Git in RStudio (standard add-commmit-history)
    - Using Git in the Terminal of RStudio (moving in history with checkout,
    creating branches, adding and updating remotes)
    - Setting up GitHub for R package (make use of usethis), pushing and pulling

- Checking correctness of code
    - Unit test (with testthat)
    - Code coverage (with covr)
    - With devtools

- Build management
    - With devtools
    - Maybe with drake?
    - Pre-push running test, build, and check
    - Continuous integration using Travis and/or GitHub Actions and AppVeyor 
    (for Windows building)

- Developing documentation and tutorials on usage
    - Vignettes, README (with rmarkdown and usethis)
    - Function documentation (with roxygen2), part 2
    - learnr tutorials via `use_tutorials()`?
    - Running spell checks and styling (with spelling and styler)

- Involving the community:
    - Designing your package to be used by or contributed to from the community
    (refer to Mozilla Science Labs Open Leaders material)
    - Contributing guidelines 
    - Being inclusive (code of conduct)
    - Licensing
    - NEWS file

- Exposing your package to the world with a website:
    - Setting up a website (with pkgdown)
    - Customizing the themes
    - Getting all resources and material organized
    - Defining lifecycle of your package and individual functions (with lifecycle)

- Version control: Workflows around using GitHub (part 2)
    - Make use of R builtin tools like the usethis pull request helpers 
    (and learning how to make use of this yourself)

- Project management of your package development (either sole or in a team)
    - Issue tracking
    - Labeling
    - Project boards
    - Milestones

- Preparing for package release
    - Check builds on other systems (with rhub)
    - Running local CRAN checks
    - Managing your versions, git tagging

- R package development in a team-based environment
    - Making use of GitHub Organizations/Teams
    - Branch protection, member roles
    - Decision making
    - Governance
    - Issue assignment
    - Relying on and using code of conduct to build culture and standards
