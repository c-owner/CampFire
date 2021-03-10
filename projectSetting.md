## eclipse

Window - preferences - XML Catalog



#### **config add**

Location : http://mybatis.org/dtd/mybatis-3-config.dtd

Key :  -//mybatis.org//DTD Config 3.0//EN



#### mapper add

Location : http://mybatis.org/dtd/mybatis-3-mapper.dtd

Key :  -//mybatis.org//DTD Mapper 3.0//EN





## intelliJ





## Docker🐳

명령의 제외 된 포트 범위에 해당 포트가있을 수 있습니다. `netsh interface ipv4 show excludedportrange protocol=tcp`

위 티켓에 언급 된 솔루션을 사용할 수 있습니다.

1. hyper-v 비활성화 (몇 번의 다시 시작이 필요함)

   `dism.exe /Online /Disable-Feature:Microsoft-Hyper-V`

2. 필요한 모든 재시작을 마친 후 원하는 포트를 예약하여 hyper-v가 다시 예약하지 않도록합니다.

   `netsh int ipv4 add excludedportrange protocol=tcp startport=1600numberofports=1`

3. hyper-V를 다시 활성화합니다 (두 번 다시 시작해야 함).

   `dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All`

