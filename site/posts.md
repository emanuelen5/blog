---
title: Posts
permalink: /posts/
navlink: true
shortname: Posts
sortindex: 1
---

<div class="mb-2 small">
	<div class="d-grid">
		<button class="btn btn-outline-secondary" collapsing-target="#filters">
			<div class="row px-2">
				<div class="col-auto me-auto">
					Filters
				</div>
				<div class="col-auto">
					⥍ <!-- Up/down arrow symbol -->
				</div>
			</div>
		</button>
	</div>
	<div class="collapsing" id="filters">
		<div class="row g-0 justify-content-center">
			{%- include tags_n_categories.html -%}
			{%- assign tags = tags | sort_natural -%}
			{%- assign categories = categories | sort_natural -%}

			{%- for tag in tags -%}
				<div class="col-auto"><button class="btn btn-dark badge bg-dark tag mini-margin">{{tag}}</button></div>
			{%- endfor -%}
			{%- for category in categories -%}
				<div class="col-auto"><button class="btn btn-info badge bg-info category mini-margin">{{category}}</button></div>
			{%- endfor -%}
		</div>
		<div class="mb-2"></div>
	</div>
</div>

{%- for p in site.posts -%}
<div class="card my-3" id="{{p.id}}">
	<div class="card-body px-sm-3 px-1 py-1">
		<h5 class="card-title">
			<a class="stretched-link" href="{{p.url}}">
				{%- if p.thumbnail -%}
				<span style="width:1.5em; text-align:center; display: inline-block; overflow: hidden;"><img style="height:1em;" alt="Post thumbnail" src="{{p.thumbnail}}"/></span>
				{%- endif -%}
			{{p.title}}</a>
			<div>
				{%- if p.draft == true -%}
				<span>
					<div class="badge btn-warning bg-warning">DRAFT</div>
				</span>
				{%- endif -%}
				<span class="tags">
				{%- for t in p.tags -%}
					<button class="btn btn-dark badge bg-dark tag">{{t}}</button>
				{%- endfor -%}
				</span>
				<span class="categories">
				{%- for c in p.categories -%}
					<button class="btn btn-info badge bg-info category">{{c}}</button>
				{%- endfor -%}
				</span>
			</div>
		</h5>
		<div class="card-subtitle">{{p.date | date: "%Y-%m-%d"}}</div>
		<div class="card-text">{{p.description}}</div>
	</div>
</div>
{%- endfor -%}

<script src="/assets/js/posts.js"></script>
