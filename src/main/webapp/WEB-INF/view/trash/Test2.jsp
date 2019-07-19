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
						<span data-p-role="title" class="p-title-line">elements&nbsp;&nbsp;<i
							class="fa fa-list"></i></span>
					</div>
					<div>
						<div class="p-subtitle text-right" data-base-class="p-subtitle">
							<span data-p-role="subtitle" class="p-title-side">Input</span>
						</div>
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
							<label for="search1">Search</label>
							<div class="input-group p-has-icon">
								<input type="search" id="search1" name="search1"
									placeholder="Tags" class="form-control"> <span
									class="input-group-state"><span class="p-position"><span
										class="p-text"><span class="p-valid-text"><i
												class="fa fa-check"></i></span> <span class="p-error-text"><i
												class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span> <span
									class="input-group-icon"><i class="fa fa-search"></i></span>
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
						<div class="p-subtitle text-right" data-base-class="p-subtitle">
							<span data-p-role="subtitle" class="p-title-side">Select</span>
						</div>
						<div class="form-group">
							<label class="input-group p-custom-arrow"><select
								id="fruitsSel1" name="fruitsSel1" class="form-control"><option
										class="p-select-default" value="">Select fruit</option>
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
						<div class="form-group">
							<select id="fruitsSel2" name="fruitsSel2" multiple="multiple"
								class="form-control"><option class="p-select-default"
									value="">Select fruit</option>
								<option value="apple">Apple</option>
								<option value="apricot">Apricot</option>
								<option value="avocado">Avocado</option>
								<option value="banana">Banana</option>
								<option value="cherry">Cherry</option>
								<option value="clementine">Clementine</option>
								<option value="coconut">Coconut</option>
								<option value="lemon">Lemon</option>
								<option value="mango">Mango</option>
								<option value="melon">Melon</option></select>
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
							<span data-p-role="subtitle" class="p-title-side">Colors</span>
						</div>
						<div class="form-group">
							<label for="colorpick">Colorpick</label>
							<div class="p-form-colorpick">
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="191970"><span class="p-color-block"
										style="background: #191970"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="663399"><span class="p-color-block"
										style="background: #663399"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="696969"><span class="p-color-block"
										style="background: #696969"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="708090"><span class="p-color-block"
										style="background: #708090"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="778899"><span class="p-color-block"
										style="background: #778899"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="800000"><span class="p-color-block"
										style="background: #800000"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="800080"><span class="p-color-block"
										style="background: #800080"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="808000"><span class="p-color-block"
										style="background: #808000"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="808080"><span class="p-color-block"
										style="background: #808080"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="F0F8FF"><span class="p-color-block"
										style="background: #F0F8FF"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FAEBD7"><span class="p-color-block"
										style="background: #FAEBD7"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="00FFFF"><span class="p-color-block"
										style="background: #00FFFF"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="7FFFD4"><span class="p-color-block"
										style="background: #7FFFD4"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="F0FFFF"><span class="p-color-block"
										style="background: #F0FFFF"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="F5F5DC"><span class="p-color-block"
										style="background: #F5F5DC"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFE4C4"><span class="p-color-block"
										style="background: #FFE4C4"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="000000"><span class="p-color-block"
										style="background: #000000"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFEBCD"><span class="p-color-block"
										style="background: #FFEBCD"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="0000FF"><span class="p-color-block"
										style="background: #0000FF"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="8A2BE2"><span class="p-color-block"
										style="background: #8A2BE2"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="A52A2A"><span class="p-color-block"
										style="background: #A52A2A"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="DEB887"><span class="p-color-block"
										style="background: #DEB887"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="5F9EA0"><span class="p-color-block"
										style="background: #5F9EA0"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="7FFF00"><span class="p-color-block"
										style="background: #7FFF00"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="D2691E"><span class="p-color-block"
										style="background: #D2691E"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FF7F50"><span class="p-color-block"
										style="background: #FF7F50"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="6495ED"><span class="p-color-block"
										style="background: #6495ED"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFF8DC"><span class="p-color-block"
										style="background: #FFF8DC"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="DC143C"><span class="p-color-block"
										style="background: #DC143C"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="00008B"><span class="p-color-block"
										style="background: #00008B"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="008B8B"><span class="p-color-block"
										style="background: #008B8B"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="B8860B"><span class="p-color-block"
										style="background: #B8860B"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="A9A9A9"><span class="p-color-block"
										style="background: #A9A9A9"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="006400"><span class="p-color-block"
										style="background: #006400"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="BDB76B"><span class="p-color-block"
										style="background: #BDB76B"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="8B008B"><span class="p-color-block"
										style="background: #8B008B"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="556B2F"><span class="p-color-block"
										style="background: #556B2F"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FF8C00"><span class="p-color-block"
										style="background: #FF8C00"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="9932CC"><span class="p-color-block"
										style="background: #9932CC"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="8B0000"><span class="p-color-block"
										style="background: #8B0000"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="E9967A"><span class="p-color-block"
										style="background: #E9967A"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="8FBC8F"><span class="p-color-block"
										style="background: #8FBC8F"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="483D8B"><span class="p-color-block"
										style="background: #483D8B"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="2F4F4F"><span class="p-color-block"
										style="background: #2F4F4F"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="00CED1"><span class="p-color-block"
										style="background: #00CED1"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="9400D3"><span class="p-color-block"
										style="background: #9400D3"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FF1493"><span class="p-color-block"
										style="background: #FF1493"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="00BFFF"><span class="p-color-block"
										style="background: #00BFFF"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="1E90FF"><span class="p-color-block"
										style="background: #1E90FF"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="B22222"><span class="p-color-block"
										style="background: #B22222"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFFAF0"><span class="p-color-block"
										style="background: #FFFAF0"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="228B22"><span class="p-color-block"
										style="background: #228B22"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FF00FF"><span class="p-color-block"
										style="background: #FF00FF"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="DCDCDC"><span class="p-color-block"
										style="background: #DCDCDC"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="F8F8FF"><span class="p-color-block"
										style="background: #F8F8FF"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFD700"><span class="p-color-block"
										style="background: #FFD700"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="DAA520"><span class="p-color-block"
										style="background: #DAA520"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="008000"><span class="p-color-block"
										style="background: #008000"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="ADFF2F"><span class="p-color-block"
										style="background: #ADFF2F"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="F0FFF0"><span class="p-color-block"
										style="background: #F0FFF0"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FF69B4"><span class="p-color-block"
										style="background: #FF69B4"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="CD5C5C"><span class="p-color-block"
										style="background: #CD5C5C"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="4B0082"><span class="p-color-block"
										style="background: #4B0082"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFFFF0"><span class="p-color-block"
										style="background: #FFFFF0"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="F0E68C"><span class="p-color-block"
										style="background: #F0E68C"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="E6E6FA"><span class="p-color-block"
										style="background: #E6E6FA"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFF0F5"><span class="p-color-block"
										style="background: #FFF0F5"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="7CFC00"><span class="p-color-block"
										style="background: #7CFC00"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFFACD"><span class="p-color-block"
										style="background: #FFFACD"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="ADD8E6"><span class="p-color-block"
										style="background: #ADD8E6"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="F08080"><span class="p-color-block"
										style="background: #F08080"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="E0FFFF"><span class="p-color-block"
										style="background: #E0FFFF"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FAFAD2"><span class="p-color-block"
										style="background: #FAFAD2"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="D3D3D3"><span class="p-color-block"
										style="background: #D3D3D3"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="90EE90"><span class="p-color-block"
										style="background: #90EE90"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFB6C1"><span class="p-color-block"
										style="background: #FFB6C1"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFA07A"><span class="p-color-block"
										style="background: #FFA07A"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="20B2AA"><span class="p-color-block"
										style="background: #20B2AA"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="87CEFA"><span class="p-color-block"
										style="background: #87CEFA"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="B0C4DE"><span class="p-color-block"
										style="background: #B0C4DE"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFFFE0"><span class="p-color-block"
										style="background: #FFFFE0"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="00FF00"><span class="p-color-block"
										style="background: #00FF00"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="32CD32"><span class="p-color-block"
										style="background: #32CD32"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FAF0E6"><span class="p-color-block"
										style="background: #FAF0E6"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="66CDAA"><span class="p-color-block"
										style="background: #66CDAA"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="0000CD"><span class="p-color-block"
										style="background: #0000CD"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="BA55D3"><span class="p-color-block"
										style="background: #BA55D3"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="9370DB"><span class="p-color-block"
										style="background: #9370DB"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="3CB371"><span class="p-color-block"
										style="background: #3CB371"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="7B68EE"><span class="p-color-block"
										style="background: #7B68EE"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="00FA9A"><span class="p-color-block"
										style="background: #00FA9A"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="48D1CC"><span class="p-color-block"
										style="background: #48D1CC"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="C71585"><span class="p-color-block"
										style="background: #C71585"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="F5FFFA"><span class="p-color-block"
										style="background: #F5FFFA"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFE4E1"><span class="p-color-block"
										style="background: #FFE4E1"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFE4B5"><span class="p-color-block"
										style="background: #FFE4B5"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFDEAD"><span class="p-color-block"
										style="background: #FFDEAD"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="000080"><span class="p-color-block"
										style="background: #000080"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FDF5E6"><span class="p-color-block"
										style="background: #FDF5E6"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="6B8E23"><span class="p-color-block"
										style="background: #6B8E23"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFA500"><span class="p-color-block"
										style="background: #FFA500"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FF4500"><span class="p-color-block"
										style="background: #FF4500"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="DA70D6"><span class="p-color-block"
										style="background: #DA70D6"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="EEE8AA"><span class="p-color-block"
										style="background: #EEE8AA"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="98FB98"><span class="p-color-block"
										style="background: #98FB98"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="AFEEEE"><span class="p-color-block"
										style="background: #AFEEEE"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="DB7093"><span class="p-color-block"
										style="background: #DB7093"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFEFD5"><span class="p-color-block"
										style="background: #FFEFD5"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFDAB9"><span class="p-color-block"
										style="background: #FFDAB9"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="CD853F"><span class="p-color-block"
										style="background: #CD853F"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFC0CB"><span class="p-color-block"
										style="background: #FFC0CB"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="DDA0DD"><span class="p-color-block"
										style="background: #DDA0DD"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="B0E0E6"><span class="p-color-block"
										style="background: #B0E0E6"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FF0000"><span class="p-color-block"
										style="background: #FF0000"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="BC8F8F"><span class="p-color-block"
										style="background: #BC8F8F"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="4169E1"><span class="p-color-block"
										style="background: #4169E1"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="8B4513"><span class="p-color-block"
										style="background: #8B4513"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FA8072"><span class="p-color-block"
										style="background: #FA8072"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="F4A460"><span class="p-color-block"
										style="background: #F4A460"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="2E8B57"><span class="p-color-block"
										style="background: #2E8B57"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFF5EE"><span class="p-color-block"
										style="background: #FFF5EE"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="A0522D"><span class="p-color-block"
										style="background: #A0522D"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="C0C0C0"><span class="p-color-block"
										style="background: #C0C0C0"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="87CEEB"><span class="p-color-block"
										style="background: #87CEEB"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="6A5ACD"><span class="p-color-block"
										style="background: #6A5ACD"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFFAFA"><span class="p-color-block"
										style="background: #FFFAFA"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="00FF7F"><span class="p-color-block"
										style="background: #00FF7F"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="4682B4"><span class="p-color-block"
										style="background: #4682B4"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="D2B48C"><span class="p-color-block"
										style="background: #D2B48C"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="008080"><span class="p-color-block"
										style="background: #008080"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="D8BFD8"><span class="p-color-block"
										style="background: #D8BFD8"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FF6347"><span class="p-color-block"
										style="background: #FF6347"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="40E0D0"><span class="p-color-block"
										style="background: #40E0D0"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="EE82EE"><span class="p-color-block"
										style="background: #EE82EE"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="F5DEB3"><span class="p-color-block"
										style="background: #F5DEB3"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFFFFF"><span class="p-color-block"
										style="background: #FFFFFF"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="F5F5F5"><span class="p-color-block"
										style="background: #F5F5F5"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="FFFF00"><span class="p-color-block"
										style="background: #FFFF00"></span></label>
								</div>
								<div class="p-radio-color">
									<label><input type="radio" name="colorpick"
										value="9ACD32"><span class="p-color-block"
										style="background: #9ACD32"></span></label>
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