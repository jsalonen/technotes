# AWS CloudFront

CloudFront is a Content Delivery Network (CDN):

Key terms:

- **Edge Location**: Location where content is cached
- **Origin**: Origin location for the files to be distributed (S3, EC2, ELB, Route53)
- **Distribution**: Name for the collection of edge locations that are used to distribute the content
- **TTL**: Time to Time, time for which objects are cached

Distribution types:

- Web Distribution: web content
- RTMP: media streaming

Restrict Viewer Access. Possible with:

- Signed URLs
- Signed cookies

## Invalidation

- Create invalidations to invalidate distribution caches partially or completely
