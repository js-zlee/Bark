
### 个人用户
暂不支持单个请求推送到多台设备，可通过分别发送的方式实现多设备推送。

### 中间服务
如果你的服务需要大批量且及时地向用户发送推送，建议自建服务端。可以提供 Url Scheme 方便用户一键更改服务器。

Url Scheme 示例：
```
bark://addServer?address=https%3A%2F%2Fapi.day.app
```
bark-server 对配置要求很低，以下是美西 VPS 各配置下的 QPS 测试结果 ：

| Cores | Ram | Speed |
| ----- | ----------- |----------- |
| 1 | 3.75 gb |4,023 p/sec |
| 4 | 16 gb |21,413 p/sec |
| 16 | 64 gb |64,516 p/sec |
| 64 | 256 gb |105,263 p/sec |

如果服务的 QPS 不高于 200，可继续使用公共服务（https://api.day.app）。

若 QPS 超过 200，推荐自建服务端，未来在公共服务器负载过高时，可能会引入流量限制（目前尚未限制）。
若 QPS 超过3000，尽量自建服务端，部署时添加 --max-apns-client-count 参数，详情请查看[部署文档](/deploy)