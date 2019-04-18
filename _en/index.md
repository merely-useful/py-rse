---
root: true
redirect_from: "/"
permalink: "/en/"
---

<div align="center">
  <p><img src="{{'/figures/pratchett-back-in-black.png'|relative_url}}" width="400" alt="Terry Pratchett (from the BBC documentary 'Back in Black')" /></p>
  <p><em>Coming back to where you started is not the same as never leaving.<br/>&ndash; Sir Terry Pratchett</em></p>
</div>

This GitHub organization contains material for two semester-long courses on computing skills for researchers:

1.  [One Extra Fact](https://merely-useful.github.io/one-extra-fact/):
    a pragmatic introduction to research computing.
    -   An introduction to tidy data using spreadsheets
    -   The basics of Python: lists, loops, conditionals, libraries, and functions
    -   Using the Unix shell: basic commands up to pipes and simple shell scripts
    -   The basics of Git
    -   Line-oriented text processing (including the basics of regular expressions)
    -   Simple array manipulations with NumPy
    -   Simple data frame manipulations with Pandas
    -   How to publish a static web site using Jekyll and GitHub Pages
2.  [Still Magic](https://merely-useful.github.io/still-magic/):
    how to put research software into production and still be home in time for dinner.
    -   The elements of programming style
    -   Installing and managing libraries
    -   Automating workflows with Make
    -   Testing
    -   Continuous integration
    -   A branch-per-feature Git workflow
    -   Organizing projects
    -   Building and sharing packages
    -   Doing code review

The titles of these courses are all quotations from [Sir Terry Pratchett][pratchett-terry],
and the lessons are designed using the methods outlined in [[Wils2018](#CITE)].
Feedback and contributions are very welcome;
please see our [Code of Conduct](./conduct/) for guidance.

## Meeting Procedure {#s:index-meetings}

1.  Before each meeting, anyone who wishes may sponsor a proposal by filing an issue in [this GitHub repository][config-repo] tagged "proposal".  Proposals must be filed at least 24 hours before a meeting in order to be considered at that meeting, and must include:
    -   a one-line summary (the subject line of the issue)
    -   the full text of the proposal
    -   any required background information
    -   pros and cons
    -   possible alternatives

2.  A quorum is established in a meeting if half or more of voting members are present.

3.  Once a person has sponsored a proposal, they are responsible for it. The group may not discuss or vote on the issue unless the sponsor or their delegate is present. The sponsor is also responsible for presenting the item to the group.

4.  After the sponsor presents the proposal, a "sense" vote is cast for the proposal prior to any discussion:
    -   Who likes the proposal?
    -   Who can live with the proposal?
    -   Who is uncomfortable with the proposal?

5.  If all or most of the group likes or can live with the proposal, it is immediately moved to a formal vote with no further discussion.

6.  If most of the group is uncomfortable with the proposal, it is postponed for further rework by the sponsor.

7.  If some members are uncomfortable they can briefly state their objections.  A timer is then set for a brief discussion moderated by the facilitator.  After 10 minutes or when no one has anything further to add (whichever comes first), the facilitator calls for a yes-or-no vote on the question: "Should we implement this decision over the stated objections?" If a majority votes "yes" the proposal is implemented; otherwise, the proposal is returned to the sponsor for further work.

## Contributors {#s:index-contributors}

{% include people.html %}

{% include links.md %}
