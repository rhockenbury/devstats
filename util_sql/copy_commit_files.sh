sudo -u postgres pg_dump --data-only -d gha -t gha_postprocess_scripts -t gha_skip_commits -t gha_commits_files -t gha_events_commits_files > gha.sql
sudo -u postgres pg_dump --data-only -d prometheus -t gha_postprocess_scripts -t gha_skip_commits -t gha_commits_files -t gha_events_commits_files > prometheus.sql
sudo -u postgres pg_dump --data-only -d opentracing -t gha_postprocess_scripts -t gha_skip_commits -t gha_commits_files -t gha_events_commits_files > opentracing.sql
sudo -u postgres pg_dump --data-only -d fluentd -t gha_postprocess_scripts -t gha_skip_commits -t gha_commits_files -t gha_events_commits_files > fluentd.sql
sudo -u postgres pg_dump --data-only -d linkerd -t gha_postprocess_scripts -t gha_skip_commits -t gha_commits_files -t gha_events_commits_files > linkerd.sql
sudo -u postgres pg_dump --data-only -d grpc -t gha_postprocess_scripts -t gha_skip_commits -t gha_commits_files -t gha_events_commits_files > grpc.sql
sudo -u postgres pg_dump --data-only -d coredns -t gha_postprocess_scripts -t gha_skip_commits -t gha_commits_files -t gha_events_commits_files > coredns.sql
sudo -u postgres pg_dump --data-only -d containerd -t gha_postprocess_scripts -t gha_skip_commits -t gha_commits_files -t gha_events_commits_files > containerd.sql
