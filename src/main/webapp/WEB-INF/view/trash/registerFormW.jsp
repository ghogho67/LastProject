<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>

  <link rel="stylesheet" href="${cp}/resource/wrap/Test/bootstrap-rtl.min.css" />
  <link rel="stylesheet" href="${cp}/resource/wrap/Test/bootstrap.min.css" />
  <link rel="stylesheet" href="${cp}/resource/wrap/Test/flat-forms-plus.css" />
  <link rel="stylesheet" href="${cp}/resource/wrap/Test/style-rtl.css" />
  <link rel="stylesheet" href="${cp}/resource/wrap/Test/modern-forms-plus.css" />
  <link rel="stylesheet" href="${cp}/resource/wrap/Test/livepreview.css" />
  <link rel="stylesheet" href="${cp}/resource/wrap/Test/orange.css" />
  <link rel="stylesheet" href="${cp}/resource/wrap/Test/cadetBlue.css" />

</head>

<body>


	<div class="wrap-offset">
		<div class="container-fluid">
			<form id="p-form-skin" method="post" action="#"
				class="modern-p-form modern-ao-form-rtl p-form-modern-cadetBlue">
				<div data-base-class="p-form" class="p-form p-shadowed p-form-md">
					<div class="p-title" data-base-class="p-title">
						<span data-p-role="title" class="p-title-line">회원가입&nbsp;&nbsp;<i
							class="fa fa-list"></i></span>
					</div>
					<div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="text">Text</label>
									<div class="input-group p-has-icon">
										<input type="text" id="text" name="text"
											placeholder="some text" class="form-control"> <span
											class="input-group-state"><span class="p-position"><span
												class="p-text"><span class="p-valid-text"><i
														class="fa fa-check"></i></span> <span class="p-error-text"><i
														class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
										<span class="input-group-icon"><i
											class="fa fa-pencil-square-o"></i></span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="password">Password</label>
									<div class="input-group p-has-icon">
										<input type="password" id="password" name="password"
											placeholder="password" class="form-control"> <span
											class="input-group-state"><span class="p-position"><span
												class="p-text"><span class="p-valid-text"><i
														class="fa fa-check"></i></span> <span class="p-error-text"><i
														class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
										<span class="input-group-icon"><i class="fa fa-lock"></i></span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="email1">Email</label>
									<div class="input-group p-has-icon">
										<input type="email" id="email1" name="email1"
											placeholder="your@mail.com" class="form-control"> <span
											class="input-group-state"><span class="p-position"><span
												class="p-text"><span class="p-valid-text"><i
														class="fa fa-check"></i></span> <span class="p-error-text"><i
														class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
										<span class="input-group-icon"><i
											class="fa fa-envelope-o"></i></span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="url">Url</label>
									<div class="input-group p-has-icon">
										<input type="url" id="url" name="url"
											placeholder="http://www.mysite.com" class="form-control">
										<span class="input-group-state"><span
											class="p-position"><span class="p-text"><span
													class="p-valid-text"><i class="fa fa-check"></i></span> <span
													class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
											class="p-field-cb"></span> <span class="input-group-icon"><i
											class="fa fa-globe"></i></span>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<div class="form-group">
							<label for="textarea">Textarea</label>
							<div class="input-group p-has-icon">
								<textarea id="textarea" name="textarea" class="form-control"></textarea>
								<span class="input-group-state"><span class="p-position"><span
										class="p-text"><span class="p-valid-text"><i
												class="fa fa-check"></i></span> <span class="p-error-text"><i
												class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span> <span
									class="input-group-icon"><i class="fa fa-file-text-o"></i></span>
							</div>
						</div>
					</div>
					
					
					
					<div class="clearfix">
						<div class="form-group">
							<label class="input-group p-custom-arrow"><select
								id="fruitsSel1" name="fruitsSel1" class="form-control"><option
										class="p-select-default" value="">제공가능한 서비스</option>
									<option value="apple">Apple</option>
									<option value="apricot">Apricot</option>
									<option value="avocado">Avocado</option>
									<option value="banana">Banana</option>
									<option value="cherry">Cherry</option>
									<option value="clementine">Clementine</option>
									<option value="coconut">Coconut</option>
									<option value="lemon">Lemon</option>
									<option value="mango">Mango</option>
									<option value="melon">Melon</option></select><span
								class="input-group-state"><span class="p-position"><span
										class="p-text"><span class="p-valid-text"><i
												class="fa fa-check"></i></span> <span class="p-error-text"><i
												class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span> <span
								class="p-select-arrow"><i class="fa fa-caret-down"></i></span></label>
						</div>
					
					</div>
					<div class="clearfix">
						<div class="p-subtitle text-right" data-base-class="p-subtitle">
							<span data-p-role="subtitle" class="p-title-side">File
								upload</span>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<div class="p-file-wrap">
										<input type="file" id="fileupload1" name="fileupload1"
											placeholder="select file..."
											onchange="document.getElementById('fileupload1-fake').value = this.value">
										<div class="input-group">
											<span class="input-group-btn"><button type="button"
													class="btn">browse</button></span> <input type="text"
												id="fileupload1-fake" placeholder="select file..."
												readonly="readonly" class="form-control p-ignore-field">
											<span class="input-group-state"><span
												class="p-position"><span class="p-text"><span
														class="p-valid-text"><i class="fa fa-check"></i></span> <span
														class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
												class="p-field-cb"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<div class="p-file-wrap">
										<input type="file" id="fileupload2" name="fileupload2"
											placeholder="select file..."
											onchange="document.getElementById('fileupload2-fake').value = this.value">
										<div class="input-group">
											<input type="text" id="fileupload2-fake"
												placeholder="select file..." readonly="readonly"
												class="form-control p-ignore-field"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-btn"><button type="button"
													class="btn">browse</button></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<div class="p-file-wrap">
										<input type="file" id="fileupload3" name="fileupload3"
											placeholder="select file..."
											onchange="document.getElementById('fileupload3-fake').value = this.value">
										<div class="input-group p-has-icon">
											<input type="text" id="fileupload3-fake"
												placeholder="select file..." readonly="readonly"
												class="form-control p-ignore-field"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-icon"><i
												class="fa fa-download"></i></span> <span class="input-group-btn"><button
													type="button" class="btn">browse</button></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<div class="p-file-wrap">
										<input type="file" id="fileupload4" name="fileupload4"
											placeholder="select file..."
											onchange="document.getElementById('fileupload4-fake').value = this.value">
										<div class="input-group">
											<span class="input-group-btn"><button type="button"
													class="btn">browse</button></span> <input type="text"
												id="fileupload4-fake" placeholder="select file..."
												readonly="readonly" class="form-control p-ignore-field">
											<span class="input-group-state"><span
												class="p-position"><span class="p-text"><span
														class="p-valid-text"><i class="fa fa-check"></i></span> <span
														class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
												class="p-field-cb"></span> <span class="input-group-addon"><span
												class="p-addon-bg"><i class="fa fa-download"></i></span></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="clearfix">
						<div class="p-subtitle text-right" data-base-class="p-subtitle">
							<span data-p-role="subtitle" class="p-title-side">Widget
								addon &amp; button</span>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<div class="input-group p-has-icon">
										<input type="email" id="email2" name="email2"
											placeholder="email" class="form-control"> <span
											class="input-group-state"><span class="p-position"><span
												class="p-text"><span class="p-valid-text"><i
														class="fa fa-check"></i></span> <span class="p-error-text"><i
														class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
										<span class="input-group-icon"><i class="fa fa-at"></i></span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<div class="input-group p-has-icon">
										<input type="text" id="price" name="price" placeholder="price"
											class="form-control"> <span class="input-group-state"><span
											class="p-position"><span class="p-text"><span
													class="p-valid-text"><i class="fa fa-check"></i></span> <span
													class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
											class="p-field-cb"></span> <span class="input-group-icon"><i
											class="fa fa-usd"></i></span> <span class="input-group-addon"><span
											class="p-addon-bg">.00</span></span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group p-has-icon">
								<input type="email" id="email3" name="email3"
									placeholder="email" class="form-control"> <span
									class="input-group-state"><span class="p-position"><span
										class="p-text"><span class="p-valid-text"><i
												class="fa fa-check"></i></span> <span class="p-error-text"><i
												class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span> <span
									class="input-group-icon"><i class="fa fa-envelope-o"></i></span>
								<span class="input-group-addon"><span class="p-addon-bg">@gmail.com</span></span>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<div class="input-group">
										<input type="search" id="search2" name="search2"
											class="form-control"> <span class="input-group-state"><span
											class="p-position"><span class="p-text"><span
													class="p-valid-text"><i class="fa fa-check"></i></span> <span
													class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
											class="p-field-cb"></span> <span class="input-group-btn"><button
												type="button" class="btn">
												<i class="fa fa-search"></i>
											</button></span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<div class="input-group">
										<input type="search" id="search3" name="search3"
											class="form-control"> <span class="input-group-state"><span
											class="p-position"><span class="p-text"><span
													class="p-valid-text"><i class="fa fa-check"></i></span> <span
													class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
											class="p-field-cb"></span> <span class="input-group-btn"><button
												type="button" class="btn">Go!</button></span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-btn"><button type="button"
												class="btn">Subscribe</button></span> <input type="email"
											id="subscribe" name="subscribe"
											placeholder="enter your email" class="form-control">
										<span class="input-group-state"><span
											class="p-position"><span class="p-text"><span
													class="p-valid-text"><i class="fa fa-check"></i></span> <span
													class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
											class="p-field-cb"></span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<div class="input-group">
										<input type="email" id="subscribe" name="subscribe"
											placeholder="enter your email" class="form-control">
										<span class="input-group-state"><span
											class="p-position"><span class="p-text"><span
													class="p-valid-text"><i class="fa fa-check"></i></span> <span
													class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
											class="p-field-cb"></span> <span class="input-group-btn"><button
												type="button" class="btn">Subscribe</button></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix">
						<div class="p-subtitle text-right" data-base-class="p-subtitle">
							<span data-p-role="subtitle" class="p-title-side">Link</span>
						</div>
						<div class="form-group">
							<div class="checkbox">
								<label><input type="checkbox" id="terms" name="terms">
									<span class="p-check-icon"><span class="p-check-block"></span></span>
									<span class="p-label">I have read and agree with <a
										href="#" target="_blank">Terms of service</a></span></label>
							</div>
						</div>
					</div>
					<div class="clearfix">
						<div class="p-subtitle text-right" data-base-class="p-subtitle">
							<span data-p-role="subtitle" class="p-title-side">Checkbox
								and Radio</span>
						</div>
						<h5>Columned</h5>
						<div class="row">
							<div class="col-md-6">
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<div class="p-form-cg">
												<div class="checkbox">
													<label><input type="checkbox" name="fruitcheck1[]"
														value="cherry"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Cherry</span></label>
												</div>
												<div class="checkbox">
													<label><input type="checkbox" name="fruitcheck1[]"
														value="lemon"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Lemon</span></label>
												</div>
												<div class="checkbox">
													<label><input type="checkbox" name="fruitcheck1[]"
														value="melon"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Melon</span></label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<div class="p-form-cg pt-form-cross-panel">
												<div class="checkbox">
													<label><input type="checkbox" name="fruitcheck2[]"
														value="cherry"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Cherry</span></label>
												</div>
												<div class="checkbox">
													<label><input type="checkbox" name="fruitcheck2[]"
														value="lemon"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Lemon</span></label>
												</div>
												<div class="checkbox">
													<label><input type="checkbox" name="fruitcheck2[]"
														value="melon"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Melon</span></label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<div class="p-form-cg pt-form-panel">
												<div class="checkbox">
													<label><input type="checkbox" name="fruitcheck3[]"
														value="cherry"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Cherry</span></label>
												</div>
												<div class="checkbox">
													<label><input type="checkbox" name="fruitcheck3[]"
														value="lemon"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Lemon</span></label>
												</div>
												<div class="checkbox">
													<label><input type="checkbox" name="fruitcheck3[]"
														value="melon"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Melon</span></label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<div class="p-form-cg">
												<div class="radio">
													<label><input type="radio" name="fruitradio1"
														value="cherry"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Cherry</span></label>
												</div>
												<div class="radio">
													<label><input type="radio" name="fruitradio1"
														value="lemon"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Lemon</span></label>
												</div>
												<div class="radio">
													<label><input type="radio" name="fruitradio1"
														value="melon"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Melon</span></label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<div class="p-form-cg pt-form-cross-panel">
												<div class="radio">
													<label><input type="radio" name="fruitradio2"
														value="cherry"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Cherry</span></label>
												</div>
												<div class="radio">
													<label><input type="radio" name="fruitradio2"
														value="lemon"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Lemon</span></label>
												</div>
												<div class="radio">
													<label><input type="radio" name="fruitradio2"
														value="melon"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Melon</span></label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<div class="p-form-cg pt-form-panel">
												<div class="radio">
													<label><input type="radio" name="fruitradio3"
														value="cherry"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Cherry</span></label>
												</div>
												<div class="radio">
													<label><input type="radio" name="fruitradio3"
														value="lemon"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Lemon</span></label>
												</div>
												<div class="radio">
													<label><input type="radio" name="fruitradio3"
														value="melon"> <span class="p-check-icon"><span
															class="p-check-block"></span></span> <span class="p-label">Melon</span></label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<h5>Inline</h5>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<div class="p-form-cg pt-form-inline">
										<div class="checkbox">
											<label><input type="checkbox" name="fruitcheck4[]"
												value="cherry"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">Cherry</span></label>
										</div>
										<div class="checkbox">
											<label><input type="checkbox" name="fruitcheck4[]"
												value="lemon"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">Lemon</span></label>
										</div>
										<div class="checkbox">
											<label><input type="checkbox" name="fruitcheck4[]"
												value="melon"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">Melon</span></label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<div class="p-form-cg pt-form-inline">
										<div class="radio">
											<label><input type="radio" name="fruitradio4"
												value="cherry"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">Cherry</span></label>
										</div>
										<div class="radio">
											<label><input type="radio" name="fruitradio4"
												value="lemon"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">Lemon</span></label>
										</div>
										<div class="radio">
											<label><input type="radio" name="fruitradio4"
												value="melon"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">Melon</span></label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<h5>With input</h5>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<div class="p-form-cg">
										<div class="checkbox">
											<label><input type="checkbox" name="checkWithInput[]"
												value="cherry"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">cherry</span></label>
										</div>
										<div class="checkbox">
											<label><input type="checkbox" name="checkWithInput[]"
												value="lemon"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">lemon</span></label>
										</div>
										<div class="checkbox">
											<label><input type="checkbox" name="checkWithInput[]"
												value="melon"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">melon</span></label>
										</div>
										<div class="checkbox">
											<label class="p-check-input"><input type="checkbox"
												name="checkWithInput[]" value="other" class="p-check-input">
												<span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="form-group"><div
														class="input-group p-has-icon">
														<input type="text" id="check-other" name="checkOther"
															placeholder="other" class="form-control"> <span
															class="input-group-state"><span class="p-position"><span
																class="p-text"><span class="p-valid-text"><i
																		class="fa fa-check"></i></span> <span class="p-error-text"><i
																		class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
														<span class="input-group-icon"><i
															class="fa fa-pencil-square-o"></i></span>
													</div></span></label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<div class="p-form-cg">
										<div class="radio">
											<label><input type="radio" name="radioWithInput"
												value="cherry"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">cherry</span></label>
										</div>
										<div class="radio">
											<label><input type="radio" name="radioWithInput"
												value="lemon"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">lemon</span></label>
										</div>
										<div class="radio">
											<label><input type="radio" name="radioWithInput"
												value="melon"> <span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">melon</span></label>
										</div>
										<div class="radio">
											<label class="p-check-input"><input type="radio"
												name="radioWithInput" value="other" class="p-check-input">
												<span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="form-group"><div
														class="input-group p-has-icon">
														<input type="text" id="radio-other" name="radioOther"
															placeholder="other" class="form-control"> <span
															class="input-group-state"><span class="p-position"><span
																class="p-text"><span class="p-valid-text"><i
																		class="fa fa-check"></i></span> <span class="p-error-text"><i
																		class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
														<span class="input-group-icon"><i
															class="fa fa-pencil-square-o"></i></span>
													</div></span></label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix">
						<div class="p-subtitle text-right" data-base-class="p-subtitle">
							<span data-p-role="subtitle" class="p-title-side">Switch</span>
						</div>
						<h5>Columned</h5>
						<div class="row">
							<div class="col-md-6">
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<div class="p-form-sg">
												<div class="p-switch">
													<label><input type="checkbox" name="fruitswitch1[]"
														value="cherry"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Cherry</span></label>
												</div>
												<div class="p-switch">
													<label><input type="checkbox" name="fruitswitch1[]"
														value="lemon"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Lemon</span></label>
												</div>
												<div class="p-switch">
													<label><input type="checkbox" name="fruitswitch1[]"
														value="melon"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Melon</span></label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<div class="p-form-sg pt-form-cross-panel">
												<div class="p-switch">
													<label><input type="checkbox" name="fruitswitch2[]"
														value="cherry"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Cherry</span></label>
												</div>
												<div class="p-switch">
													<label><input type="checkbox" name="fruitswitch2[]"
														value="lemon"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Lemon</span></label>
												</div>
												<div class="p-switch">
													<label><input type="checkbox" name="fruitswitch2[]"
														value="melon"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Melon</span></label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<div class="p-form-sg pt-form-panel">
												<div class="p-switch">
													<label><input type="checkbox" name="fruitswitch3[]"
														value="cherry"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Cherry</span></label>
												</div>
												<div class="p-switch">
													<label><input type="checkbox" name="fruitswitch3[]"
														value="lemon"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Lemon</span></label>
												</div>
												<div class="p-switch">
													<label><input type="checkbox" name="fruitswitch3[]"
														value="melon"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Melon</span></label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<div class="p-form-sg">
												<div class="p-radioswitch">
													<label><input type="radio" name="fruitradioswitch1"
														value="cherry"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Cherry</span></label>
												</div>
												<div class="p-radioswitch">
													<label><input type="radio" name="fruitradioswitch1"
														value="lemon"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Lemon</span></label>
												</div>
												<div class="p-radioswitch">
													<label><input type="radio" name="fruitradioswitch1"
														value="melon"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Melon</span></label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<div class="p-form-sg pt-form-cross-panel">
												<div class="p-radioswitch">
													<label><input type="radio" name="fruitradioswitch2"
														value="cherry"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Cherry</span></label>
												</div>
												<div class="p-radioswitch">
													<label><input type="radio" name="fruitradioswitch2"
														value="lemon"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Lemon</span></label>
												</div>
												<div class="p-radioswitch">
													<label><input type="radio" name="fruitradioswitch2"
														value="melon"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Melon</span></label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<div class="p-form-sg pt-form-panel">
												<div class="p-radioswitch">
													<label><input type="radio" name="fruitradioswitch3"
														value="cherry"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Cherry</span></label>
												</div>
												<div class="p-radioswitch">
													<label><input type="radio" name="fruitradioswitch3"
														value="lemon"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Lemon</span></label>
												</div>
												<div class="p-radioswitch">
													<label><input type="radio" name="fruitradioswitch3"
														value="melon"> <span class="p-switch-icon"
														data-checked="yes" data-unchecked="no"></span> <span
														class="p-label">Melon</span></label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<h5>Inline</h5>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<div class="p-form-sg pt-form-inline">
										<div class="p-switch">
											<label><input type="checkbox" name="fruitswitch4[]"
												value="cherry"> <span class="p-switch-icon"
												data-checked="yes" data-unchecked="no"></span> <span
												class="p-label">Cherry</span></label>
										</div>
										<div class="p-switch">
											<label><input type="checkbox" name="fruitswitch4[]"
												value="lemon"> <span class="p-switch-icon"
												data-checked="yes" data-unchecked="no"></span> <span
												class="p-label">Lemon</span></label>
										</div>
										<div class="p-switch">
											<label><input type="checkbox" name="fruitswitch4[]"
												value="melon"> <span class="p-switch-icon"
												data-checked="yes" data-unchecked="no"></span> <span
												class="p-label">Melon</span></label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<div class="p-form-sg pt-form-inline">
										<div class="p-radioswitch">
											<label><input type="radio" name="fruitradioswitch4"
												value="cherry"> <span class="p-switch-icon"
												data-checked="yes" data-unchecked="no"></span> <span
												class="p-label">Cherry</span></label>
										</div>
										<div class="p-radioswitch">
											<label><input type="radio" name="fruitradioswitch4"
												value="lemon"> <span class="p-switch-icon"
												data-checked="yes" data-unchecked="no"></span> <span
												class="p-label">Lemon</span></label>
										</div>
										<div class="p-radioswitch">
											<label><input type="radio" name="fruitradioswitch4"
												value="melon"> <span class="p-switch-icon"
												data-checked="yes" data-unchecked="no"></span> <span
												class="p-label">Melon</span></label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<h5>With input</h5>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<div class="p-form-sg">
										<div class="p-switch">
											<label><input type="checkbox"
												name="switchWithInput[]" value="cherry"> <span
												class="p-switch-icon" data-checked="yes" data-unchecked="no"></span>
												<span class="p-label">cherry</span></label>
										</div>
										<div class="p-switch">
											<label><input type="checkbox"
												name="switchWithInput[]" value="lemon"> <span
												class="p-switch-icon" data-checked="yes" data-unchecked="no"></span>
												<span class="p-label">lemon</span></label>
										</div>
										<div class="p-switch">
											<label><input type="checkbox"
												name="switchWithInput[]" value="melon"> <span
												class="p-switch-icon" data-checked="yes" data-unchecked="no"></span>
												<span class="p-label">melon</span></label>
										</div>
										<div class="p-switch">
											<label class="p-check-input"><input type="checkbox"
												name="switchWithInput[]" value="other" class="p-check-input">
												<span class="p-switch-icon" data-checked="yes"
												data-unchecked="no"></span> <span class="form-group"><div
														class="input-group p-has-icon">
														<input type="text" id="switch-other" name="switchOther"
															placeholder="other" class="form-control"> <span
															class="input-group-state"><span class="p-position"><span
																class="p-text"><span class="p-valid-text"><i
																		class="fa fa-check"></i></span> <span class="p-error-text"><i
																		class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
														<span class="input-group-icon"><i
															class="fa fa-pencil-square-o"></i></span>
													</div></span></label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<div class="p-form-sg">
										<div class="p-radioswitch">
											<label><input type="radio"
												name="radioswitchWithInput" value="cherry"> <span
												class="p-switch-icon" data-checked="yes" data-unchecked="no"></span>
												<span class="p-label">cherry</span></label>
										</div>
										<div class="p-radioswitch">
											<label><input type="radio"
												name="radioswitchWithInput" value="lemon"> <span
												class="p-switch-icon" data-checked="yes" data-unchecked="no"></span>
												<span class="p-label">lemon</span></label>
										</div>
										<div class="p-radioswitch">
											<label><input type="radio"
												name="radioswitchWithInput" value="melon"> <span
												class="p-switch-icon" data-checked="yes" data-unchecked="no"></span>
												<span class="p-label">melon</span></label>
										</div>
										<div class="p-radioswitch">
											<label class="p-check-input"><input type="radio"
												name="radioswitchWithInput" value="other"
												class="p-check-input"> <span class="p-switch-icon"
												data-checked="yes" data-unchecked="no"></span> <span
												class="form-group"><div
														class="input-group p-has-icon">
														<input type="text" id="radioswitch-other"
															name="radioswitchOther" placeholder="other"
															class="form-control"> <span
															class="input-group-state"><span class="p-position"><span
																class="p-text"><span class="p-valid-text"><i
																		class="fa fa-check"></i></span> <span class="p-error-text"><i
																		class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
														<span class="input-group-icon"><i
															class="fa fa-pencil-square-o"></i></span>
													</div></span></label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix">
						<div class="p-subtitle text-right" data-base-class="p-subtitle">
							<span data-p-role="subtitle" class="p-title-side">Rating</span>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="quality">Quality</label>
									<div class="p-rating">
										<div class="pull-right">
											<input type="radio" id="quality-cancel" name="quality"
												class="p-rating-cancel"><label for="quality-cancel"
												class="p-field-cancel"><i class="fa fa-times"></i></label><input
												type="radio" id="quality-5" name="quality" value="5"><label
												for="quality-5"><span class="p-rating-active-icon"><i
													class="fa fa-star"></i></span><span class="p-rating-icon"><i
													class="fa fa-star-o"></i></span></label><input type="radio" id="quality-4"
												name="quality" value="4"><label for="quality-4"><span
												class="p-rating-active-icon"><i class="fa fa-star"></i></span><span
												class="p-rating-icon"><i class="fa fa-star-o"></i></span></label><input
												type="radio" id="quality-3" name="quality" value="3"><label
												for="quality-3"><span class="p-rating-active-icon"><i
													class="fa fa-star"></i></span><span class="p-rating-icon"><i
													class="fa fa-star-o"></i></span></label><input type="radio" id="quality-2"
												name="quality" value="2"><label for="quality-2"><span
												class="p-rating-active-icon"><i class="fa fa-star"></i></span><span
												class="p-rating-icon"><i class="fa fa-star-o"></i></span></label><input
												type="radio" id="quality-1" name="quality" value="1"><label
												for="quality-1"><span class="p-rating-active-icon"><i
													class="fa fa-star"></i></span><span class="p-rating-icon"><i
													class="fa fa-star-o"></i></span></label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="female">Female (min: 1)</label>
									<div class="p-rating">
										<div class="pull-right">
											<input type="radio" id="female-8" name="female" value="8"><label
												for="female-8"><span class="p-rating-icon"><i
													class="fa fa-female"></i></span></label><input type="radio" id="female-7"
												name="female" value="7"><label for="female-7"><span
												class="p-rating-icon"><i class="fa fa-female"></i></span></label><input
												type="radio" id="female-6" name="female" value="6"><label
												for="female-6"><span class="p-rating-icon"><i
													class="fa fa-female"></i></span></label><input type="radio" id="female-5"
												name="female" value="5"><label for="female-5"><span
												class="p-rating-icon"><i class="fa fa-female"></i></span></label><input
												type="radio" id="female-4" name="female" value="4"><label
												for="female-4"><span class="p-rating-icon"><i
													class="fa fa-female"></i></span></label><input type="radio" id="female-3"
												name="female" value="3"><label for="female-3"><span
												class="p-rating-icon"><i class="fa fa-female"></i></span></label><input
												type="radio" id="female-2" name="female" value="2"><label
												for="female-2"><span class="p-rating-icon"><i
													class="fa fa-female"></i></span></label><input type="radio" id="female-1"
												name="female" value="1" checked="checked"><label
												for="female-1"><span class="p-rating-icon"><i
													class="fa fa-female"></i></span></label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="service">Service</label>
									<div class="p-rating">
										<div class="pull-right">
											<input type="radio" id="service-cancel" name="service"
												class="p-rating-cancel"><label for="service-cancel"
												class="p-field-cancel"><i class="fa fa-times"></i></label><input
												type="radio" id="service-5" name="service" value="5"><label
												for="service-5"><span class="p-rating-icon"><i
													class="fa fa-thumbs-o-up"></i></span></label><input type="radio"
												id="service-4" name="service" value="4"><label
												for="service-4"><span class="p-rating-icon"><i
													class="fa fa-thumbs-o-up"></i></span></label><input type="radio"
												id="service-3" name="service" value="3"><label
												for="service-3"><span class="p-rating-icon"><i
													class="fa fa-thumbs-o-up"></i></span></label><input type="radio"
												id="service-2" name="service" value="2"><label
												for="service-2"><span class="p-rating-icon"><i
													class="fa fa-thumbs-o-up"></i></span></label><input type="radio"
												id="service-1" name="service" value="1"><label
												for="service-1"><span class="p-rating-icon"><i
													class="fa fa-thumbs-o-up"></i></span></label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="male">Male (min: 1)</label>
									<div class="p-rating">
										<div class="pull-right">
											<input type="radio" id="male-8" name="male" value="8"><label
												for="male-8"><span class="p-rating-icon"><i
													class="fa fa-male"></i></span></label><input type="radio" id="male-7"
												name="male" value="7"><label for="male-7"><span
												class="p-rating-icon"><i class="fa fa-male"></i></span></label><input
												type="radio" id="male-6" name="male" value="6"><label
												for="male-6"><span class="p-rating-icon"><i
													class="fa fa-male"></i></span></label><input type="radio" id="male-5"
												name="male" value="5"><label for="male-5"><span
												class="p-rating-icon"><i class="fa fa-male"></i></span></label><input
												type="radio" id="male-4" name="male" value="4"><label
												for="male-4"><span class="p-rating-icon"><i
													class="fa fa-male"></i></span></label><input type="radio" id="male-3"
												name="male" value="3"><label for="male-3"><span
												class="p-rating-icon"><i class="fa fa-male"></i></span></label><input
												type="radio" id="male-2" name="male" value="2"><label
												for="male-2"><span class="p-rating-icon"><i
													class="fa fa-male"></i></span></label><input type="radio" id="male-1"
												name="male" value="1" checked="checked"><label
												for="male-1"><span class="p-rating-icon"><i
													class="fa fa-male"></i></span></label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="rating">Rating (min: 1)</label>
									<div class="p-rating">
										<div class="pull-right">
											<input type="radio" id="rating-5" name="rating" value="5"><label
												for="rating-5"><span class="p-rating-active-icon"><i
													class="fa fa-smile-o"></i></span><span class="p-rating-icon"><i
													class="fa fa-meh-o"></i></span></label><input type="radio" id="rating-4"
												name="rating" value="4"><label for="rating-4"><span
												class="p-rating-active-icon"><i class="fa fa-smile-o"></i></span><span
												class="p-rating-icon"><i class="fa fa-meh-o"></i></span></label><input
												type="radio" id="rating-3" name="rating" value="3"><label
												for="rating-3"><span class="p-rating-active-icon"><i
													class="fa fa-smile-o"></i></span><span class="p-rating-icon"><i
													class="fa fa-meh-o"></i></span></label><input type="radio" id="rating-2"
												name="rating" value="2"><label for="rating-2"><span
												class="p-rating-active-icon"><i class="fa fa-smile-o"></i></span><span
												class="p-rating-icon"><i class="fa fa-meh-o"></i></span></label><input
												type="radio" id="rating-1" name="rating" value="1"
												checked="checked"><label for="rating-1"><span
												class="p-rating-active-icon"><i class="fa fa-smile-o"></i></span><span
												class="p-rating-icon"><i class="fa fa-meh-o"></i></span></label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="child">Child</label>
									<div class="p-rating">
										<div class="pull-right">
											<input type="radio" id="child-cancel" name="child"
												class="p-rating-cancel"><label for="child-cancel"
												class="p-field-cancel"><i class="fa fa-times"></i></label><input
												type="radio" id="child-5" name="child" value="5"><label
												for="child-5"><span class="p-rating-icon"><i
													class="fa fa-child"></i></span></label><input type="radio" id="child-4"
												name="child" value="4"><label for="child-4"><span
												class="p-rating-icon"><i class="fa fa-child"></i></span></label><input
												type="radio" id="child-3" name="child" value="3"><label
												for="child-3"><span class="p-rating-icon"><i
													class="fa fa-child"></i></span></label><input type="radio" id="child-2"
												name="child" value="2"><label for="child-2"><span
												class="p-rating-icon"><i class="fa fa-child"></i></span></label><input
												type="radio" id="child-1" name="child" value="1"><label
												for="child-1"><span class="p-rating-icon"><i
													class="fa fa-child"></i></span></label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="preview-btn text-left p-buttons">
						<button class="btn" type="submit">submit</button>
						<button class="btn" type="reset">reset</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>