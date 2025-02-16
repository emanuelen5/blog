---
title: Tips
permalink: /tips/
navlink: true
shortname: Tips
sortindex: 2
---

{%- assign tips = site.tips | sort: 'date' | reverse -%}
{%- for p in tips -%}
<div class="card my-3" id="{{p.id}}">
	<div class="card-body px-sm-3 px-1 py-1">
		<h5 class="card-title my-0">
			<a class="stretched-link" href="{{p.url}}">
				{%- if p.thumbnail -%}
				<span style="width:1.5em; text-align:center; display: inline-block; overflow: hidden;"><img style="height:1em;" alt="Post thumbnail" src="{{p.thumbnail}}"/></span>
				{%- endif -%}
			{{p.what | markdownify}}</a>
		</h5>
		<div class="card-text"><small>{{p.why}}</small>
			<div class="d-inline-block">
				{%- if p.draft == true -%}
				<span>
					<div class="badge bg-warning">DRAFT</div>
				</span>
				{%- endif -%}
				<span class="tags">
				{%- for t in p.tags -%}
					<button class="btn badge bg-dark tag">{{t}}</button>
				{%- endfor -%}
				</span>
				<span class="categories">
				{%- for c in p.categories -%}
					<button class="btn badge bg-info category">{{c}}</button>
				{%- endfor -%}
				</span>
			</div>
		</div>
	</div>
</div>
{%- endfor -%}
