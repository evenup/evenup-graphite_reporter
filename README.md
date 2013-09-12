puppet-graphite
==============

Description
-----------

A Puppet report processor for sending metrics to a [Graphite](http://graphite.wikidot.com/) server.

Requirements
------------

* `Puppet`
* A [Graphite](http://graphite.wikidot.com/) server

Installation & Usage
--------------------

1.  Install puppet_graphite as a module in your Puppet master's module path.

2.  Include the puppuet class:
        class { 'puppet_graphite':
          graphite_host =>  'graphite.mycompany.com'
        }

3.  Enable pluginsync (default on puppet => 3.0) and reports on your master and clients in `puppet.conf`

        [master]
        report = true
        reports = graphite
        pluginsync = true
        [agent]
        report = true
        pluginsync = true

4.  Run the Puppet client and sync the report as a plugin

Author
------

Justin Lambert <jlambert@letsevenup.com>
Forked from [puppet-graphite](https://github.com/nareshov/puppet-graphite) by Naresh V. <nareshov@gmail.com>
Derived from [puppet-ganglia](https://github.com/jamtur01/puppet-ganglia) by James Turnbull <james@lovedthanlost.net>

Original License
----------------

    Author:: James Turnbull (<james@lovedthanlost.net>)
    Copyright:: Copyright (c) 2011 James Turnbull
    License:: Apache License, Version 2.0

    Author:: Naresh V. (<nareshov@gmail.com>)
    Copyright:: Copyright (c) 2011 Naresh V.
    License:: Apache License, Version 2.0

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

License of this derived work
----------------------------

    Same as above plus:
    Author:: Justin Lambert. (<jlambert@letsevenup.com>)
    Copyright:: Copyright (c) 2013 EvenUp.
    License:: Apache License, Version 2.0
