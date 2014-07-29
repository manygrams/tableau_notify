=== Tableau Notifier for Mac

This simple application shows notifications in the Apple Notification Center whenever Tableau runs a query against an external data source. To use the notifier, you simply do:

```
gem install tableau_notify
tableau-notify
```

This will show the queries in the console, but will also display desktop notifications. If you click on the desktop notification, your default text editor for files with the `sql` extension will open the full query.

PRs are welcome.
