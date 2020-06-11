CREATE TABLE IF NOT EXISTS default.graphite_reverse (
  Path String,
  Value Float64,
  Time UInt32,
  Date Date,
  Timestamp UInt32
) ENGINE = GraphiteMergeTree('graphite_rollup')
PARTITION BY toYYYYMM(Date)
ORDER BY (Path, Time);

CREATE TABLE IF NOT EXISTS default.graphite_index (
  Date Date,
  Level UInt32,
  Path String,
  Version UInt32
) ENGINE = ReplacingMergeTree(Version)
PARTITION BY toYYYYMM(Date)
ORDER BY (Level, Path, Date);

CREATE TABLE IF NOT EXISTS default.graphite_tagged (
  Date Date,
  Tag1 String,
  Path String,
  Tags Array(String),
  Version UInt32
) ENGINE = ReplacingMergeTree(Version)
PARTITION BY toYYYYMM(Date)
ORDER BY (Tag1, Path, Date);

-- https://www.altinity.com/blog/clickhouse-for-time-series
CREATE DATABASE IF NOT EXISTS benchmark;

CREATE TABLE IF NOT EXISTS benchmark.cpu (
        created_date Date DEFAULT today(),
        created_at DateTime DEFAULT now(),
        time String,
        tags_id UInt32,
        usage_user Float64,
        usage_system Float64,
        usage_idle Float64,
        usage_nice Float64,
        usage_iowait Float64,
        usage_irq Float64,
        usage_softirq Float64,
        usage_steal Float64,
        usage_guest Float64,
        usage_guest_nice Float64,
        additional_tags String DEFAULT ''
        ) ENGINE = MergeTree(created_date, (tags_id, created_at), 8192);

CREATE TABLE IF NOT EXISTS benchmark.tags (
        created_date Date DEFAULT today(),
        created_at DateTime DEFAULT now(),
        id UInt32,
        hostname String,
        region String,
        datacenter String,
        rack String,
        os String,
        arch String,
        team String,
        service String,
        service_version String,
        service_environment String
        )  ENGINE = MergeTree(created_date, id, 8192);
