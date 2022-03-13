from abc import *

class Campaign:
    def __init__(
            self,
            campaign_id,
            site_type,
            url,
            title,
            category,
            tags,
            body,
            organization_name,
            thumbnail,
            due_date,
            start_date,
            target_price,
            status_price,
            percent,
    ):
        self.campaign_id = campaign_id
        self.site_type = site_type
        self.url = url
        self.title = title
        self.tags = tags
        self.body = body
        self.organization_name = organization_name
        self.thumbnail = thumbnail
        self.due_date = due_date
        self.start_date = start_date
        self.target_price = target_price
        self.status_price = status_price
        self.percent = percent
