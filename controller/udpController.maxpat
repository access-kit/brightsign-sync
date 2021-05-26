{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 2,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ -7.0, 48.0, 1537.0, 919.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 15,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 898.0, 663.0, 43.0, 22.0 ],
					"text" : "rot180"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 549.0, 835.0, 29.5, 22.0 ],
					"text" : "t l l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 553.0, 772.0, 95.0, 22.0 ],
					"text" : "routepass query"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 995.0, 133.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 645.0, 722.0, 57.0, 22.0 ],
					"text" : "tosymbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 563.0, 663.0, 149.0, 22.0 ],
					"text" : "config commandPort 9500"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 923.0, 141.0, 32.0, 22.0 ],
					"text" : "print"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 190.0, 300.0, 75.0, 22.0 ],
					"text" : "ignoreclick 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 569.0, 104.0, 70.0, 22.0 ],
					"text" : "loadmess 2"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 1,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-7",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "configControls.maxpat",
					"numinlets" : 2,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "updateContent" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 48.0, 1122.0, 906.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 11,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-90",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1820.0, 104.0, 71.0, 22.0 ],
									"text" : "fromsymbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-110",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1819.454545454545496, 304.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-101",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1820.454545454545496, 479.5, 81.0, 22.0 ],
									"text" : "s #0-config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-88",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1819.454545454545496, 128.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-87",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1820.454545454545496, 451.951825261116028, 95.0, 22.0 ],
									"text" : "prepend volume"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-82",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1842.621212121212011, 149.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"activedialcolor" : [ 0.980392156862745, 0.980392156862745, 0.980392156862745, 1.0 ],
									"appearance" : 3,
									"dialcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"id" : "obj-80",
									"maxclass" : "live.dial",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1819.454545454545496, 234.0, 50.0, 63.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 686.454545454545496, 164.228395061728406, 50.0, 63.0 ],
									"saved_attribute_attributes" : 									{
										"activedialcolor" : 										{
											"expression" : ""
										}
,
										"dialcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_longname" : "live.dial",
											"parameter_mmax" : 100.0,
											"parameter_shortname" : "Volume",
											"parameter_type" : 1,
											"parameter_unitstyle" : 5
										}

									}
,
									"textcolor" : [ 0.850980392156863, 0.827450980392157, 0.827450980392157, 1.0 ],
									"varname" : "live.dial"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-86",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 466.0, 27.0, 22.0, 22.0 ],
									"text" : "t b"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-81",
									"linecount" : 14,
									"maxclass" : "o.compose",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 619.25, -123.0, 200.5, 201.0 ],
									"saved_bundle_data" : [ 35, 98, 117, 110, 100, 108, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 47, 112, 108, 97, 121, 101, 114, 73, 68, 0, 0, 0, 44, 105, 0, 0, 0, 0, 0, 1, 0, 0, 0, 20, 47, 118, 105, 100, 101, 111, 112, 97, 116, 104, 0, 0, 44, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 47, 119, 111, 114, 107, 73, 68, 0, 44, 105, 0, 0, 0, 0, 0, 1, 0, 0, 0, 20, 47, 117, 112, 100, 97, 116, 101, 87, 101, 98, 0, 0, 44, 115, 0, 0, 111, 102, 102, 0, 0, 0, 0, 20, 47, 115, 121, 110, 99, 71, 114, 111, 117, 112, 0, 0, 44, 105, 0, 0, 0, 0, 0, 1, 0, 0, 0, 24, 47, 115, 121, 110, 99, 77, 111, 100, 101, 0, 0, 0, 44, 115, 0, 0, 115, 111, 108, 111, 0, 0, 0, 0, 0, 0, 0, 20, 47, 115, 121, 110, 99, 85, 82, 76, 0, 0, 0, 0, 44, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 47, 99, 111, 109, 109, 97, 110, 100, 80, 111, 114, 116, 0, 0, 0, 0, 44, 105, 0, 0, 0, 0, 37, 28, 0, 0, 0, 24, 47, 111, 114, 103, 97, 110, 105, 122, 97, 116, 105, 111, 110, 0, 0, 0, 44, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 47, 105, 112, 0, 44, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 47, 102, 105, 114, 109, 119, 97, 114, 101, 85, 82, 76, 0, 0, 0, 0, 44, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 47, 118, 105, 100, 101, 111, 85, 82, 76, 0, 0, 0, 44, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 47, 111, 115, 99, 68, 101, 98, 117, 103, 0, 0, 0, 44, 115, 0, 0, 111, 110, 0, 0, 0, 0, 0, 16, 47, 118, 111, 108, 117, 109, 101, 0, 44, 115, 0, 0, 48, 0, 0, 0 ],
									"saved_bundle_length" : 352,
									"text" : "/playerID : 1,\n/videopath : \"\",\n/workID : 1,\n/updateWeb : \"off\",\n/syncGroup : 1,\n/syncMode : \"solo\",\n/syncURL : \"\",\n/commandPort : 9500,\n/organization : \"\",\n/ip : \"\",\n/firmwareURL : \"\",\n/videoURL : \"\",\n/oscDebug : \"on\",\n/volume : \"0\""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-66",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 434.0, -7.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "flash" ],
									"patching_rect" : [ 342.871212121212125, 812.0, 41.0, 22.0 ],
									"text" : "t flash"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-154",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 312.833333333333314, 480.5, 81.0, 22.0 ],
									"text" : "s #0-config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-155",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 312.833333333333314, 422.951825261116028, 63.0, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-156",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 312.833333333333314, 309.951825261116028, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-157",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 312.833333333333314, 285.5, 30.773822741075037, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 552.5, 125.364197530864203, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[32]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Update",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[16]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-158",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 368.28787878787881, 336.0, 71.0, 22.0 ],
									"text" : "outputvalue"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-159",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 312.833333333333314, 452.951825261116028, 93.0, 22.0 ],
									"text" : "prepend workID"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bordercolor" : [ 0.980392156862745, 0.980392156862745, 0.980392156862745, 1.0 ],
									"focusbordercolor" : [ 0.905882352941176, 0.870588235294118, 0.870588235294118, 1.0 ],
									"fontname" : "Roboto Mono",
									"fontsize" : 13.0,
									"id" : "obj-160",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 358.28787878787881, 364.0, 66.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 127.099999999999966, 373.0, 21.0 ],
									"saved_attribute_attributes" : 									{
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_longname" : "live.numbox[7]",
											"parameter_shortname" : "live.numbox",
											"parameter_type" : 1,
											"parameter_units" : "Work #%d",
											"parameter_unitstyle" : 9
										}

									}
,
									"textcolor" : [ 1.0, 0.988235294117647, 0.988235294117647, 1.0 ],
									"varname" : "live.numbox[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-161",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 370.833333333333314, 166.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-162",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 355.28787878787881, 114.0, 71.0, 22.0 ],
									"text" : "fromsymbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-163",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 355.28787878787881, 142.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 0,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 13.0,
									"id" : "obj-153",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 680.0, 889.5, 149.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 14.5, 125.599999999999994, 149.0, 24.0 ],
									"text" : "Work to Timestamp:",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-152",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 504.954545454545496, 725.5, 49.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 672.454545454545496, 71.0, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[31]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "reload",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[15]"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 0,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 13.0,
									"id" : "obj-149",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 680.0, 863.5, 141.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 22.5, 263.800000000000011, 141.0, 24.0 ],
									"text" : "Remote Media URL:",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-138",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1629.037878787878753, 480.5, 81.0, 22.0 ],
									"text" : "s #0-config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-139",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1700.621212121212011, 142.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-140",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1629.037878787878753, 452.951825261116028, 109.0, 22.0 ],
									"text" : "prepend videoURL"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-141",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 1629.037878787878753, 309.951825261116028, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-142",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 1629.037878787878753, 422.951825261116028, 63.0, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-143",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 1673.037878787878753, 389.0, 59.0, 22.0 ],
									"text" : "route text"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-144",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1673.037878787878753, 114.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-145",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1629.037878787878753, 277.0, 23.999999999999773, 16.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 552.5, 263.092592592592609, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[30]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Update",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[14]"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bordercolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"fontname" : "Roboto Mono",
									"fontsize" : 13.0,
									"id" : "obj-146",
									"maxclass" : "textedit",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1673.037878787878753, 361.0, 53.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 263.944444444444457, 373.0, 24.0 ],
									"textcolor" : [ 0.945098039215686, 0.917647058823529, 0.917647058823529, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-137",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "updateContent" ],
									"patching_rect" : [ 238.454545454545496, 812.0, 94.0, 22.0 ],
									"text" : "t updateContent"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-136",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 238.454545454545496, 722.0, 49.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 672.454545454545496, 16.0, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[29]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "get media",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[13]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-128",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 20.0, 480.5, 81.0, 22.0 ],
									"text" : "s #0-config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-130",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 20.0, 422.951825261116028, 63.0, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-131",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 20.0, 309.951825261116028, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-132",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 20.0, 285.5, 30.773822741075037, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 552.5, 366.388888888888914, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[28]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Update",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[12]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-133",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 75.454545454545496, 336.0, 71.0, 22.0 ],
									"text" : "outputvalue"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-134",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 20.0, 452.951825261116028, 101.0, 22.0 ],
									"text" : "prepend playerID"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bordercolor" : [ 0.980392156862745, 0.980392156862745, 0.980392156862745, 1.0 ],
									"focusbordercolor" : [ 0.905882352941176, 0.870588235294118, 0.870588235294118, 1.0 ],
									"fontname" : "Roboto Mono",
									"fontsize" : 13.0,
									"id" : "obj-135",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 65.454545454545496, 364.0, 66.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 368.950000000000045, 373.0, 21.0 ],
									"saved_attribute_attributes" : 									{
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_longname" : "live.numbox[6]",
											"parameter_shortname" : "live.numbox",
											"parameter_type" : 1,
											"parameter_units" : "Player #%d",
											"parameter_unitstyle" : 9
										}

									}
,
									"textcolor" : [ 1.0, 0.988235294117647, 0.988235294117647, 1.0 ],
									"varname" : "live.numbox[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-127",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1189.787878787878753, 480.5, 81.0, 22.0 ],
									"text" : "s #0-config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-126",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1482.621212121212238, 480.5, 81.0, 22.0 ],
									"text" : "s #0-config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-123",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 768.121212121212011, 480.5, 81.0, 22.0 ],
									"text" : "s #0-config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-124",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 164.871212121212153, 480.5, 81.0, 22.0 ],
									"text" : "s #0-config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-125",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 604.121212121212125, 480.5, 81.0, 22.0 ],
									"text" : "s #0-config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-121",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 921.0, 480.5, 81.0, 22.0 ],
									"text" : "s #0-config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-122",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 472.204545454545496, 480.5, 81.0, 22.0 ],
									"text" : "s #0-config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-119",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 558.0, 725.5, 79.0, 22.0 ],
									"text" : "r #0-config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-115",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 811.954545454545496, 629.5, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-113",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1403.159090909090992, 142.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-108",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 677.0, 196.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-105",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 680.0, 629.5, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-103",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1254.454545454545496, 142.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-98",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1554.204545454545496, 142.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-97",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 78.0, 166.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-95",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 245.871212121212153, 166.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-92",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1006.0, 142.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-89",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 546.273822741075037, 142.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-85",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 831.575757575757507, 142.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-84",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 53.0, 674.0, 97.0, 22.0 ],
									"text" : "r #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-83",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 245.871212121212153, 42.0, 99.0, 22.0 ],
									"text" : "s #0-showhide"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-73",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 342.871212121212125, 725.5, 49.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 672.454545454545496, 43.5, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[27]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "get scripts",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[11]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-79",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1482.621212121212238, 452.951825261116028, 126.0, 22.0 ],
									"text" : "prepend firmwareURL"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-78",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 1482.621212121212238, 309.951825261116028, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-77",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 1482.621212121212238, 422.951825261116028, 63.0, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-76",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 1526.621212121212238, 389.0, 59.0, 22.0 ],
									"text" : "route text"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-75",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1526.621212121212238, 114.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-64",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1482.621212121212466, 277.0, 23.999999999999773, 16.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 552.5, 331.956790123456813, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[19]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Update",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[10]"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 0,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 13.0,
									"id" : "obj-65",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 680.0, 837.5, 110.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 53.5, 332.900000000000034, 110.0, 24.0 ],
									"text" : "Firmware URL:",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bordercolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"fontname" : "Roboto Mono",
									"fontsize" : 13.0,
									"id" : "obj-69",
									"maxclass" : "textedit",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1526.621212121212238, 361.0, 53.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 332.900000000000034, 373.0, 24.0 ],
									"textcolor" : [ 0.945098039215686, 0.917647058823529, 0.917647058823529, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-72",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 472.204545454545496, 452.951825261116028, 117.0, 22.0 ],
									"text" : "prepend updateWeb"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-71",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 472.204545454545496, 422.951825261116028, 71.0, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-70",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 501.704545454545496, 114.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-68",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 471.954545454545496, 309.951825261116028, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-58",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 471.954545454545496, 278.0, 32.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 552.5, 90.932098765432102, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[25]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Update",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[9]"
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
									"border" : 1,
									"bordercolor" : [ 1.0, 1.0, 1.0, 0.99 ],
									"id" : "obj-59",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 501.704545454545496, 359.0, 64.5, 26.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 91.049999999999997, 373.0, 26.0 ],
									"proportion" : 0.5,
									"rounded" : 0
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgfillcolor_angle" : 270.0,
									"bgfillcolor_autogradient" : 0.0,
									"bgfillcolor_color" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgfillcolor_color1" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
									"bgfillcolor_proportion" : 0.5,
									"bgfillcolor_type" : "color",
									"color" : [ 0.980392156862745, 0.980392156862745, 0.980392156862745, 1.0 ],
									"fontname" : "Roboto Mono",
									"fontsize" : 13.0,
									"id" : "obj-60",
									"items" : [ "on", ",", "off" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 501.704545454545496, 359.0, 64.0, 26.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 91.049999999999997, 373.0, 26.0 ]
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 0,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 13.0,
									"id" : "obj-61",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 680.0, 915.5, 157.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 6.5, 91.049999999999997, 157.0, 24.0 ],
									"text" : "Updates Timestamps:",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-53",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 399.5, 725.5, 49.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 672.454545454545496, 98.5, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[23]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "debug",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[8]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-52",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 452.5, 725.5, 49.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 672.454545454545496, 126.0, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[17]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "exit",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[7]"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 0,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 13.0,
									"id" : "obj-67",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 680.0, 811.5, 87.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 69.5, 367.450000000000045, 94.0, 24.0 ],
									"text" : "Player ID:",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 62.454545454545496, 114.0, 71.0, 22.0 ],
									"text" : "fromsymbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-63",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 62.454545454545496, 142.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1233.787878787878753, 114.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1189.787878787878753, 452.951825261116028, 121.0, 22.0 ],
									"text" : "prepend organization"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-55",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 1233.787878787878753, 389.0, 59.0, 22.0 ],
									"text" : "route text"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 1189.787878787878753, 422.951825261116028, 63.0, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 1189.787878787878753, 309.951825261116028, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-48",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1189.787878787878753, 274.0, 28.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 552.5, 297.524691358024711, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[22]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Update",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[6]"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 0,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 13.0,
									"id" : "obj-49",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 680.0, 787.5, 110.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 45.5, 298.350000000000023, 118.0, 24.0 ],
									"text" : "Organization:",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bordercolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"fontname" : "Roboto Mono",
									"fontsize" : 13.0,
									"id" : "obj-50",
									"maxclass" : "textedit",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1233.787878787878753, 361.0, 53.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 298.350000000000023, 373.0, 24.0 ],
									"textcolor" : [ 0.945098039215686, 0.917647058823529, 0.917647058823529, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 921.0, 422.951825261116028, 38.0, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 921.0, 309.951825261116028, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 768.121212121212011, 309.951825261116028, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 768.121212121212011, 422.951825261116028, 65.416666666666856, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 604.121212121212125, 422.951825261116028, 63.0, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 604.121212121212125, 309.951825261116028, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 164.871212121212153, 309.951825261116028, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 164.871212121212153, 422.951825261116028, 63.0, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 940.0, 389.0, 59.0, 22.0 ],
									"text" : "route text"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 208.871212121212153, 395.951825261116028, 59.0, 22.0 ],
									"text" : "route text"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-23",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 164.871212121212153, 278.0, 28.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 552.5, 228.660493827160508, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[21]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Update",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[5]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-22",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 604.121212121212125, 276.0, 30.773822741075037, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 552.5, 194.228395061728406, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[26]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Update",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[4]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-19",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 768.121212121212011, 283.5, 34.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 552.5, 159.796296296296305, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[20]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Update",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 661.121212121212125, 336.0, 71.0, 22.0 ],
									"text" : "outputvalue"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-3",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 921.0, 277.0, 32.0, 16.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 552.5, 56.5, 78.0, 24.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[24]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Update",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[2]"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Roboto Mono",
									"fontsize" : 13.0,
									"id" : "obj-18",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1380.204545454545496, 175.0, 68.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 402.0, 373.0, 24.0 ],
									"textcolor" : [ 1.0, 0.988235294117647, 0.988235294117647, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 0,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 13.0,
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 680.0, 763.5, 94.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 69.5, 402.000000000000057, 94.0, 24.0 ],
									"text" : "IP Address:",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1380.204545454545496, 114.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 648.121212121212125, 114.0, 71.0, 22.0 ],
									"text" : "fromsymbol"
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
									"border" : 1,
									"bordercolor" : [ 1.0, 1.0, 1.0, 0.99 ],
									"id" : "obj-47",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 794.537878787878867, 359.0, 59.0, 26.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 160.149999999999977, 373.0, 26.0 ],
									"proportion" : 0.5,
									"rounded" : 0
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 648.121212121212125, 142.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 604.121212121212125, 452.951825261116028, 114.0, 22.0 ],
									"text" : "prepend syncGroup"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bordercolor" : [ 0.980392156862745, 0.980392156862745, 0.980392156862745, 1.0 ],
									"focusbordercolor" : [ 0.905882352941176, 0.870588235294118, 0.870588235294118, 1.0 ],
									"fontname" : "Roboto Mono",
									"fontsize" : 13.0,
									"id" : "obj-44",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 648.121212121212125, 364.0, 66.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 196.0, 373.0, 21.0 ],
									"saved_attribute_attributes" : 									{
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_longname" : "live.numbox[5]",
											"parameter_shortname" : "live.numbox",
											"parameter_type" : 1,
											"parameter_units" : "Group #%d",
											"parameter_unitstyle" : 9
										}

									}
,
									"textcolor" : [ 1.0, 0.988235294117647, 0.988235294117647, 1.0 ],
									"varname" : "live.numbox"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 921.0, 452.951825261116028, 105.0, 22.0 ],
									"text" : "prepend syncURL"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 0,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 13.0,
									"id" : "obj-39",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 680.0, 739.5, 79.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 84.5, 56.5, 79.0, 24.0 ],
									"text" : "API URL:",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 940.954545454545496, 126.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bordercolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"fontname" : "Roboto Mono",
									"fontsize" : 13.0,
									"id" : "obj-41",
									"maxclass" : "textedit",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 950.454545454545496, 361.0, 53.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 56.5, 373.0, 24.0 ],
									"textcolor" : [ 0.945098039215686, 0.917647058823529, 0.917647058823529, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 768.121212121212011, 452.951825261116028, 111.0, 22.0 ],
									"text" : "prepend syncMode"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 164.871212121212153, 452.951825261116028, 108.0, 22.0 ],
									"text" : "prepend videopath"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgfillcolor_angle" : 270.0,
									"bgfillcolor_autogradient" : 0.0,
									"bgfillcolor_color" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgfillcolor_color1" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
									"bgfillcolor_proportion" : 0.5,
									"bgfillcolor_type" : "color",
									"color" : [ 0.980392156862745, 0.980392156862745, 0.980392156862745, 1.0 ],
									"fontname" : "Roboto Mono",
									"fontsize" : 13.0,
									"id" : "obj-29",
									"items" : [ "solo", ",", "leader", ",", "follower" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 794.537878787878867, 359.0, 59.0, 26.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 160.149999999999977, 373.0, 26.0 ]
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 0,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 13.0,
									"id" : "obj-25",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 680.0, 715.5, 87.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 76.5, 160.149999999999977, 87.0, 24.0 ],
									"text" : "Sync Mode:",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 794.537878787878867, 114.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 0,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 13.0,
									"id" : "obj-21",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 680.0, 691.5, 94.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 69.5, 194.699999999999989, 94.0, 24.0 ],
									"text" : "Sync Group:",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 0,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 13.0,
									"id" : "obj-20",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 680.0, 667.5, 118.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 45.5, 229.25, 118.0, 24.0 ],
									"text" : "Current Media:",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 208.871212121212153, 114.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bordercolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"fontname" : "Roboto Mono",
									"fontsize" : 13.0,
									"id" : "obj-16",
									"maxclass" : "textedit",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 208.871212121212153, 361.0, 53.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 171.5, 229.25, 373.0, 24.0 ],
									"textcolor" : [ 0.945098039215686, 0.917647058823529, 0.917647058823529, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 15,
									"outlettype" : [ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "FullPacket" ],
									"patching_rect" : [ 62.454545454545496, 82.0, 2068.833333333333485, 22.0 ],
									"text" : "o.route /playerID /videopath /workID /updateWeb /syncGroup /syncMode /syncURL /commandPort /organization /ip /firmwareURL /videoURL /volume /oscDebug"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "FullPacket" ],
									"patching_rect" : [ 62.454545454545496, 42.0, 148.0, 22.0 ],
									"text" : "o.route /brightsign/*/config"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 62.454545454545496, 10.0, 97.0, 22.0 ],
									"text" : "udpreceive 9500"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "query", "changeHumanController" ],
									"patching_rect" : [ 53.0, 812.0, 179.0, 22.0 ],
									"text" : "t query changeHumanController"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"id" : "obj-9",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 53.0, 722.0, 44.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 48.499999999999943, 434.5, 664.0, 26.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[18]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Query Config",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 558.0, 786.5, 57.0, 22.0 ],
									"text" : "tosymbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 558.0, 757.5, 88.0, 22.0 ],
									"text" : "prepend config"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 245.871212121212153, 10.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-74",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 53.0, 876.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 3,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 24.0,
									"id" : "obj-24",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 811.954545454545496, 667.5, 358.0, 38.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 201.5, 9.0, 358.0, 38.0 ],
									"text" : "BRIGHTSIGN CONFIGURATION",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
									"border" : 1,
									"bordercolor" : [ 1.0, 1.0, 1.0, 0.99 ],
									"id" : "obj-37",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 811.954545454545496, 667.5, 358.0, 38.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 0.999999999999943, 1.0, 759.0, 473.951825261116028 ],
									"proportion" : 0.5,
									"rounded" : 0
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-83", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"midpoints" : [ 352.371212121212125, 862.0, 62.5, 862.0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"order" : 1,
									"source" : [ "obj-103", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"order" : 0,
									"source" : [ "obj-103", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-149", 0 ],
									"order" : 2,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-153", 0 ],
									"order" : 1,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"order" : 10,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"order" : 9,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"order" : 8,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"order" : 7,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"order" : 6,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"order" : 5,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-61", 0 ],
									"order" : 0,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-65", 0 ],
									"order" : 3,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 0 ],
									"order" : 4,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"order" : 1,
									"source" : [ "obj-108", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"order" : 0,
									"source" : [ "obj-108", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-87", 0 ],
									"source" : [ "obj-110", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"source" : [ "obj-113", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"order" : 1,
									"source" : [ "obj-115", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"order" : 0,
									"source" : [ "obj-115", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-119", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 0 ],
									"source" : [ "obj-12", 11 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"source" : [ "obj-12", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"source" : [ "obj-12", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-12", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-12", 5 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"source" : [ "obj-12", 6 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-12", 9 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"source" : [ "obj-12", 8 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-70", 0 ],
									"source" : [ "obj-12", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 0 ],
									"source" : [ "obj-12", 10 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-90", 0 ],
									"source" : [ "obj-12", 12 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"midpoints" : [ 222.5, 861.0, 62.5, 861.0 ],
									"source" : [ "obj-13", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-134", 0 ],
									"source" : [ "obj-130", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-130", 0 ],
									"source" : [ "obj-131", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-133", 0 ],
									"source" : [ "obj-131", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-131", 0 ],
									"source" : [ "obj-132", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-135", 0 ],
									"source" : [ "obj-133", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-128", 0 ],
									"source" : [ "obj-134", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-130", 1 ],
									"source" : [ "obj-135", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-137", 0 ],
									"source" : [ "obj-136", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"midpoints" : [ 247.954545454545496, 862.0, 62.5, 862.0 ],
									"source" : [ "obj-137", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-145", 0 ],
									"order" : 1,
									"source" : [ "obj-139", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-146", 0 ],
									"order" : 0,
									"source" : [ "obj-139", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-138", 0 ],
									"source" : [ "obj-140", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-142", 0 ],
									"source" : [ "obj-141", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-146", 0 ],
									"source" : [ "obj-141", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-140", 0 ],
									"source" : [ "obj-142", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-142", 1 ],
									"source" : [ "obj-143", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-146", 0 ],
									"source" : [ "obj-144", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-141", 0 ],
									"source" : [ "obj-145", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-143", 0 ],
									"source" : [ "obj-146", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"midpoints" : [ 544.454545454545496, 861.0, 62.5, 861.0 ],
									"source" : [ "obj-152", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-159", 0 ],
									"source" : [ "obj-155", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-155", 0 ],
									"source" : [ "obj-156", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 0 ],
									"source" : [ "obj-156", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-156", 0 ],
									"source" : [ "obj-157", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-160", 0 ],
									"source" : [ "obj-158", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-154", 0 ],
									"source" : [ "obj-159", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-155", 1 ],
									"source" : [ "obj-160", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-157", 0 ],
									"order" : 1,
									"source" : [ "obj-161", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-160", 0 ],
									"order" : 0,
									"source" : [ "obj-161", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-163", 0 ],
									"source" : [ "obj-162", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-160", 0 ],
									"source" : [ "obj-163", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 1 ],
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 1 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 1 ],
									"source" : [ "obj-29", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"source" : [ "obj-30", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-124", 0 ],
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-123", 0 ],
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"source" : [ "obj-36", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-121", 0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-42", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 1 ],
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-125", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 0 ],
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-51", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"midpoints" : [ 492.0, 862.0, 62.5, 862.0 ],
									"source" : [ "obj-52", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"midpoints" : [ 439.0, 862.0, 62.5, 862.0 ],
									"source" : [ "obj-53", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-127", 0 ],
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-68", 0 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 1 ],
									"source" : [ "obj-60", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-63", 0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-135", 0 ],
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 0 ],
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-86", 0 ],
									"source" : [ "obj-66", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-60", 0 ],
									"source" : [ "obj-68", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"source" : [ "obj-68", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-69", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-60", 0 ],
									"source" : [ "obj-70", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-72", 0 ],
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-122", 0 ],
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 0 ],
									"source" : [ "obj-75", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 1 ],
									"source" : [ "obj-76", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-79", 0 ],
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 0 ],
									"source" : [ "obj-78", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"source" : [ "obj-78", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-126", 0 ],
									"source" : [ "obj-79", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"midpoints" : [ 567.5, 862.0, 62.5, 862.0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-110", 0 ],
									"source" : [ "obj-80", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-81", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-80", 0 ],
									"source" : [ "obj-82", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-136", 0 ],
									"midpoints" : [ 62.5, 709.0, 247.954545454545496, 709.0 ],
									"order" : 4,
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-152", 0 ],
									"midpoints" : [ 62.5, 708.0, 514.454545454545496, 708.0 ],
									"order" : 0,
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"midpoints" : [ 62.5, 709.0, 462.0, 709.0 ],
									"order" : 1,
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"midpoints" : [ 62.5, 709.0, 409.0, 709.0 ],
									"order" : 2,
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"midpoints" : [ 62.5, 709.0, 352.371212121212125, 709.0 ],
									"order" : 3,
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"midpoints" : [ 62.5, 697.0, 62.5, 697.0 ],
									"order" : 5,
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"order" : 2,
									"source" : [ "obj-85", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"order" : 1,
									"source" : [ "obj-85", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 0,
									"source" : [ "obj-85", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"source" : [ "obj-86", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-101", 0 ],
									"source" : [ "obj-87", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-80", 0 ],
									"source" : [ "obj-88", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"order" : 2,
									"source" : [ "obj-89", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"order" : 1,
									"source" : [ "obj-89", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-60", 0 ],
									"order" : 0,
									"source" : [ "obj-89", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 0 ],
									"source" : [ "obj-90", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"order" : 1,
									"source" : [ "obj-92", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"order" : 0,
									"source" : [ "obj-92", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"order" : 0,
									"source" : [ "obj-95", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"order" : 1,
									"source" : [ "obj-95", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-132", 0 ],
									"order" : 1,
									"source" : [ "obj-97", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-135", 0 ],
									"order" : 0,
									"source" : [ "obj-97", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"order" : 1,
									"source" : [ "obj-98", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 0 ],
									"order" : 0,
									"source" : [ "obj-98", 0 ]
								}

							}
 ],
						"boxgroups" : [ 							{
								"boxes" : [ "obj-29", "obj-47" ]
							}
, 							{
								"boxes" : [ "obj-59", "obj-60" ]
							}
 ],
						"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
						"editing_bgcolor" : [ 0.431372549019608, 0.431372549019608, 0.431372549019608, 1.0 ]
					}
,
					"patching_rect" : [ 34.0, 553.0, 104.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.148161082797969, 216.129627883434296, 764.0, 487.52008467912674 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 34.0, 590.462961077690125, 55.0, 22.0 ],
					"text" : "s outport"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 34.0, 459.462961077690125, 82.0, 22.0 ],
					"text" : "r tabSelection"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 34.0, 488.462961077690125, 29.5, 22.0 ],
					"text" : "!= 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 34.0, 517.962961077690125, 61.0, 22.0 ],
					"text" : "hidden $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 324.592601478099823, 154.638558268547058, 70.0, 22.0 ],
					"text" : "loadmess 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-137",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 679.862443251269269, 293.638558268547058, 29.5, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-138",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 679.862443251269269, 269.638558268547058, 71.0, 22.0 ],
					"text" : "routepass 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-139",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 690.362443251269269, 327.490411758422852, 61.0, 22.0 ],
					"text" : "hidden $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-134",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 591.000012934207916, 293.638558268547058, 29.5, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-135",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 591.000012934207916, 269.638558268547058, 71.0, 22.0 ],
					"text" : "routepass 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-136",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 601.500012934207916, 327.490411758422852, 61.0, 22.0 ],
					"text" : "hidden $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-131",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 502.227522364684546, 293.638558268547058, 29.5, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-132",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 502.227522364684546, 269.638558268547058, 71.0, 22.0 ],
					"text" : "routepass 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-133",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 512.727522364684546, 327.490411758422852, 61.0, 22.0 ],
					"text" : "hidden $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-128",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 413.410061921392298, 293.638558268547058, 29.5, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-129",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 413.410061921392298, 269.638558268547058, 71.0, 22.0 ],
					"text" : "routepass 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-130",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 423.910061921392298, 327.490411758422852, 61.0, 22.0 ],
					"text" : "hidden $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-127",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 324.592601478099823, 293.638558268547058, 29.5, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-126",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 324.592601478099823, 265.638558268547058, 71.0, 22.0 ],
					"text" : "routepass 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-111",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 324.592601478099823, 461.045960545539856, 55.0, 22.0 ],
					"text" : "s outport"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-110",
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 1,
					"outlettype" : [ "query" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 27.0, 82.0, 1469.0, 851.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "query", "changeHumanController", "" ],
									"patching_rect" : [ 476.666666666666742, 519.0, 185.0, 22.0 ],
									"text" : "t query changeHumanController l"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-99",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 478.833333333333485, 100.0, 72.0, 22.0 ],
									"text" : "sprintf 2 %d"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-98",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 392.5, 100.0, 72.0, 22.0 ],
									"text" : "sprintf 1 %d"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-97",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 228.5, 100.0, 72.0, 22.0 ],
									"text" : "sprintf 0 %d"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-64",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 552.833333333333485, 92.537036836147308, 59.0, 22.0 ],
									"text" : "route text"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 512.833333333333485, 440.537036836147308, 29.5, 22.0 ],
									"text" : "t b l"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-53",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 512.833333333333485, 405.037036836147308, 38.0, 22.0 ],
									"text" : "zl.reg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 841.629629969596863, 132.537036836147308, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 184.037036836147308, 77.0, 22.0 ],
									"text" : "prepend root"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 213.037036836147308, 163.0, 22.0 ],
									"text" : "sprintf symout %s.%s.%s.%s"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 72.0, 22.0 ],
									"text" : "sprintf 4 %d"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-71",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 2,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 84.0, 132.0, 640.0, 480.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"assistshowspatchername" : 0,
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-61",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 110.0, 182.0, 79.0, 22.0 ],
													"text" : "prepend host"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-60",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 196.0, 177.0, 77.0, 22.0 ],
													"text" : "prepend port"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-59",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 192.5, 121.0, 38.0, 22.0 ],
													"text" : "zl.reg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-53",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 50.0, 153.0, 38.0, 22.0 ],
													"text" : "zl.reg"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-66",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-67",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 85.0, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-68",
													"index" : 3,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 192.5, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-69",
													"index" : 4,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 227.5, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-70",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 147.0, 264.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 0 ],
													"source" : [ "obj-53", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-60", 0 ],
													"source" : [ "obj-59", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-70", 0 ],
													"source" : [ "obj-60", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-70", 0 ],
													"source" : [ "obj-61", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-53", 0 ],
													"source" : [ "obj-66", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-53", 1 ],
													"source" : [ "obj-67", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-59", 0 ],
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-59", 1 ],
													"source" : [ "obj-69", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 476.666666666666742, 479.537036836147308, 159.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p portConfig"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "bang" ],
									"patching_rect" : [ 512.833333333333485, 184.037036836147308, 112.333333333333258, 22.0 ],
									"text" : "t b b b"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-101",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 39.999988836147281, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-102",
									"index" : 8,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 841.629638999999997, 39.999988836147281, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-103",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 228.5, 39.999988836147281, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-104",
									"index" : 3,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 392.5, 39.999988836147281, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-105",
									"index" : 7,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 722.5, 39.999988836147281, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-106",
									"index" : 4,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 478.833333333333485, 39.999988836147281, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-107",
									"index" : 6,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 669.5, 39.999988836147281, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-108",
									"index" : 5,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 552.833333333333485, -0.000011163852719, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-109",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 476.666666666666742, 561.537036836147308, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-109", 0 ],
									"source" : [ "obj-1", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-109", 0 ],
									"source" : [ "obj-1", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-109", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-101", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-102", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-97", 0 ],
									"source" : [ "obj-103", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-98", 0 ],
									"source" : [ "obj-104", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-99", 0 ],
									"source" : [ "obj-106", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 3 ],
									"source" : [ "obj-107", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-108", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 1 ],
									"source" : [ "obj-56", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"source" : [ "obj-57", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 2 ],
									"source" : [ "obj-57", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-97", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-98", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-99", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 324.592601478099823, 386.583004310787203, 640.722223103046417, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p udpConfig"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-100",
					"linecolor" : [ 0.980392156862745, 0.96078431372549, 0.96078431372549, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 324.592601478099823, 181.620042979717255, 195.5, 5.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.148161082797969, 160.333330690860748, 764.259246587753296, 5.0 ],
					"saved_attribute_attributes" : 					{
						"linecolor" : 						{
							"expression" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 679.862443251269269, 231.120042979717255, 29.5, 22.0 ],
					"text" : "!= 4"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-60",
					"linecount" : 2,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 679.862443251269269, 352.990411758422852, 61.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.148161082797969, 124.629630386829376, 178.0, 19.0 ],
					"text" : "10.51.50.130"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 946.31482458114624, 352.990411758422852, 107.0, 22.0 ],
					"text" : "loadmess 239 192"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 591.000012934207916, 231.120042979717255, 29.5, 22.0 ],
					"text" : "!= 3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 502.227522364684546, 231.120042979717255, 29.5, 22.0 ],
					"text" : "!= 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 413.410061921392298, 231.120042979717255, 29.5, 22.0 ],
					"text" : "!= 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 335.092601478099823, 327.490411758422852, 61.0, 22.0 ],
					"text" : "hidden $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 324.592601478099823, 231.120042979717255, 29.5, 22.0 ],
					"text" : "!= 0"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
					"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
					"fontsize" : 13.0,
					"hidden" : 1,
					"id" : "obj-26",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 591.000012934207916, 352.990411758422852, 77.814816236495972, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.148161082797969, 124.629630386829376, 178.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : ""
						}
,
						"activebgcolor" : 						{
							"expression" : ""
						}
,
						"bordercolor" : 						{
							"expression" : ""
						}
,
						"textcolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_longname" : "live.numbox[3]",
							"parameter_shortname" : "live.numbox[1]",
							"parameter_type" : 1,
							"parameter_units" : "Followers in Group #%d",
							"parameter_unitstyle" : 9
						}

					}
,
					"textcolor" : [ 1.0, 0.964705882352941, 0.964705882352941, 1.0 ],
					"varname" : "live.numbox[3]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
					"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
					"fontsize" : 13.0,
					"hidden" : 1,
					"id" : "obj-28",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 502.227522364684546, 352.990411758422852, 77.814816236495972, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.148161082797969, 124.629630386829376, 178.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : ""
						}
,
						"activebgcolor" : 						{
							"expression" : ""
						}
,
						"bordercolor" : 						{
							"expression" : ""
						}
,
						"textcolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_longname" : "live.numbox[4]",
							"parameter_shortname" : "live.numbox[1]",
							"parameter_type" : 1,
							"parameter_units" : "Leader of Group #%d",
							"parameter_unitstyle" : 9
						}

					}
,
					"textcolor" : [ 1.0, 0.964705882352941, 0.964705882352941, 1.0 ],
					"varname" : "live.numbox[4]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
					"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
					"fontsize" : 13.0,
					"hidden" : 1,
					"id" : "obj-24",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 413.410061921392298, 352.990411758422852, 78.814816236495972, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.148161082797969, 124.629630386829376, 178.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : ""
						}
,
						"activebgcolor" : 						{
							"expression" : ""
						}
,
						"bordercolor" : 						{
							"expression" : ""
						}
,
						"textcolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_longname" : "live.numbox[2]",
							"parameter_shortname" : "live.numbox[1]",
							"parameter_type" : 1,
							"parameter_units" : "Sync Group #%d",
							"parameter_unitstyle" : 9
						}

					}
,
					"textcolor" : [ 1.0, 0.964705882352941, 0.964705882352941, 1.0 ],
					"varname" : "live.numbox[2]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
					"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
					"fontsize" : 13.0,
					"id" : "obj-23",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 324.592601478099823, 352.990411758422852, 78.814816236495972, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.148161082797969, 124.629630386829376, 178.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : ""
						}
,
						"activebgcolor" : 						{
							"expression" : ""
						}
,
						"bordercolor" : 						{
							"expression" : ""
						}
,
						"textcolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_longname" : "live.numbox[1]",
							"parameter_shortname" : "live.numbox[1]",
							"parameter_type" : 1,
							"parameter_units" : "Player ID #%d",
							"parameter_unitstyle" : 9
						}

					}
,
					"textcolor" : [ 1.0, 0.964705882352941, 0.964705882352941, 1.0 ],
					"varname" : "live.numbox[1]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
					"bgcolor" : [ 0.631372549019608, 0.615686274509804, 0.615686274509804, 1.0 ],
					"bordercolor" : [ 1.0, 0.988235294117647, 0.988235294117647, 1.0 ],
					"fontsize" : 13.0,
					"id" : "obj-21",
					"maxclass" : "live.tab",
					"num_lines_patching" : 1,
					"num_lines_presentation" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 324.592601478099823, 190.638558268547058, 199.333332359790802, 21.592595636844635 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.148161082797969, 81.49999874830246, 760.111097574234009, 30.962963998317719 ],
					"saved_attribute_attributes" : 					{
						"activebgoncolor" : 						{
							"expression" : ""
						}
,
						"activebgcolor" : 						{
							"expression" : ""
						}
,
						"bgcolor" : 						{
							"expression" : ""
						}
,
						"bordercolor" : 						{
							"expression" : ""
						}
,
						"textcolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_enum" : [ "By Player ID", "By Group", "Leaders", "Followers", "By IP" ],
							"parameter_longname" : "live.tab[2]",
							"parameter_mmax" : 4,
							"parameter_shortname" : "live.tab",
							"parameter_type" : 2,
							"parameter_unitstyle" : 9
						}

					}
,
					"textcolor" : [ 0.980392156862745, 0.945098039215686, 0.945098039215686, 1.0 ],
					"varname" : "live.tab[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 324.592601478099823, 121.5, 84.0, 22.0 ],
					"text" : "s tabSelection"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 538.378701635769403, 728.721998691558838, 53.0, 22.0 ],
					"text" : "r outport"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 34.0, 426.0, 55.0, 22.0 ],
					"text" : "s outport"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 34.0, 243.0, 55.0, 22.0 ],
					"text" : "s outport"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 34.0, 270.0, 82.0, 22.0 ],
					"text" : "r tabSelection"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 34.0, 92.0, 82.0, 22.0 ],
					"text" : "r tabSelection"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 34.0, 299.0, 29.5, 22.0 ],
					"text" : "!= 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 34.0, 121.0, 29.5, 22.0 ],
					"text" : "!= 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 34.0, 328.5, 61.0, 22.0 ],
					"text" : "hidden $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 34.0, 150.5, 61.0, 22.0 ],
					"text" : "hidden $1"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
					"bgcolor" : [ 0.631372549019608, 0.615686274509804, 0.615686274509804, 1.0 ],
					"bordercolor" : [ 1.0, 0.988235294117647, 0.988235294117647, 1.0 ],
					"fontsize" : 13.0,
					"id" : "obj-22",
					"maxclass" : "live.tab",
					"num_lines_patching" : 1,
					"num_lines_presentation" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 324.592601478099823, 89.5, 183.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.148161082797969, 180.629627883434296, 760.0, 26.0 ],
					"saved_attribute_attributes" : 					{
						"activebgoncolor" : 						{
							"expression" : ""
						}
,
						"activebgcolor" : 						{
							"expression" : ""
						}
,
						"bgcolor" : 						{
							"expression" : ""
						}
,
						"bordercolor" : 						{
							"expression" : ""
						}
,
						"textcolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_enum" : [ "Transport", "Window", "Config" ],
							"parameter_longname" : "live.tab[1]",
							"parameter_mmax" : 2,
							"parameter_shortname" : "live.tab",
							"parameter_type" : 2,
							"parameter_unitstyle" : 9
						}

					}
,
					"textcolor" : [ 0.980392156862745, 0.945098039215686, 0.945098039215686, 1.0 ],
					"varname" : "live.tab"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 1,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-2",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "transportControls.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "fff" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 42.0, 1537.0, 919.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 15,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 173.0, 321.0, 162.0, 22.0 ],
									"text" : "\"seek 9999\""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 371.814816236495972, 127.490411758422852, 70.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 2,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 355.0, 325.0, 640.0, 478.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"assistshowspatchername" : 0,
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-3",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 344.564816236495972, 95.0, 39.0, 22.0 ],
													"text" : "round"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-26",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 359.0, 57.0, 22.0 ],
													"text" : "tosymbol"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-25",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 326.0, 81.0, 22.0 ],
													"text" : "prepend seek"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-24",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 50.0, 290.0, 29.5, 22.0 ],
													"text" : "i 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-21",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "float" ],
													"patching_rect" : [ 251.564816236495972, 210.0, 29.5, 22.0 ],
													"text" : "t b f"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-20",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "float" ],
													"patching_rect" : [ 155.564816236495972, 130.0, 29.5, 22.0 ],
													"text" : "t b f"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-19",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "int" ],
													"patching_rect" : [ 344.564816236495972, 130.0, 29.5, 22.0 ],
													"text" : "t b i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-15",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 60.5, 248.0, 220.564816236495972, 22.0 ],
													"text" : "+ 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-13",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 251.564816236495972, 176.0, 122.5, 22.0 ],
													"text" : "+ 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 60.564816236495972, 176.0, 124.5, 22.0 ],
													"text" : "+ 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 251.564816236495972, 100.0, 43.0, 22.0 ],
													"text" : "* 1000"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 155.564816236495972, 100.0, 50.0, 22.0 ],
													"text" : "* 60000"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 60.564816236495972, 100.0, 63.0, 22.0 ],
													"text" : "* 3600000"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-28",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 49.999997236495972, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-29",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 84.999997236495972, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-30",
													"index" : 3,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 155.564816236495972, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-31",
													"index" : 4,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 251.564816236495972, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-32",
													"index" : 5,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 344.564816236495972, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-33",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 49.999997236495972, 441.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 1 ],
													"source" : [ "obj-15", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 1 ],
													"source" : [ "obj-19", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"source" : [ "obj-19", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 1 ],
													"source" : [ "obj-20", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"source" : [ "obj-20", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 1 ],
													"source" : [ "obj-21", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"source" : [ "obj-21", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-25", 0 ],
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-26", 0 ],
													"source" : [ "obj-25", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"source" : [ "obj-28", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"source" : [ "obj-29", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-30", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"source" : [ "obj-31", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"source" : [ "obj-32", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 59.435183999999992, 234.0, 360.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p createSeekCommand"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-58",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 59.497364137853765, 152.990411758422852, 44.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 279.259265302287986, 105.629630386829376, 457.888895332813263, 19.259259521961212 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[33]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Seek",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[15]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-7",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 386.0, 159.990411758422852, 78.814816236495972, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 211.750000000000057, 105.629630386829376, 50.499999999999886, 19.0 ],
									"saved_attribute_attributes" : 									{
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_longname" : "live.numbox[11]",
											"parameter_mmax" : 999.0,
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_units" : "%dms",
											"parameter_unitstyle" : 9
										}

									}
,
									"textcolor" : [ 1.0, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.numbox[4]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-6",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 279.0, 155.990411758422852, 78.814816236495972, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 150.882720360932694, 105.629630386829376, 50.499999999999886, 19.0 ],
									"saved_attribute_attributes" : 									{
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_longname" : "live.numbox[10]",
											"parameter_mmax" : 59.0,
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 1,
											"parameter_units" : "%dsec",
											"parameter_unitstyle" : 9
										}

									}
,
									"textcolor" : [ 1.0, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.numbox[3]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-5",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 192.0, 155.990411758422852, 78.814816236495972, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 90.015440721865332, 105.629630386829376, 50.499999999999886, 19.0 ],
									"saved_attribute_attributes" : 									{
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_longname" : "live.numbox[9]",
											"parameter_mmax" : 59.0,
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 1,
											"parameter_units" : "%dmin",
											"parameter_unitstyle" : 9
										}

									}
,
									"textcolor" : [ 1.0, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.numbox[2]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-3",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 111.185183763504028, 152.990411758422852, 78.814816236495972, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 29.148161082797969, 105.629630386829376, 50.499999999999886, 19.0 ],
									"saved_attribute_attributes" : 									{
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_longname" : "live.numbox[8]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 1,
											"parameter_units" : "%dhr",
											"parameter_unitstyle" : 9
										}

									}
,
									"textcolor" : [ 1.0, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.numbox[1]"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 59.497364137853765, 27.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-4",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 59.435183999999992, 493.5, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-14",
									"linecolor" : [ 0.870588235294118, 0.870588235294118, 0.870588235294118, 1.0 ],
									"maxclass" : "live.line",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 771.5, 144.490411758422852, 476.0, 5.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 25.5, 93.0, 707.999999999999886, 5.0 ],
									"saved_attribute_attributes" : 									{
										"linecolor" : 										{
											"expression" : ""
										}

									}

								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 3,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 24.0,
									"hidden" : 1,
									"id" : "obj-36",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 848.5, 156.0, 299.0, 38.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 223.5, 9.0, 314.0, 38.0 ],
									"text" : "BRIGHTSIGN TRANSPORT",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "fff" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 2,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"assistshowspatchername" : 0,
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-31",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "fff", "play" ],
													"patching_rect" : [ 396.5, 140.0, 50.0, 22.0 ],
													"text" : "t fff play"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-30",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "ff", "play" ],
													"patching_rect" : [ 343.5, 140.0, 47.0, 22.0 ],
													"text" : "t ff play"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-29",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "defaultspeed", "play" ],
													"patching_rect" : [ 224.5, 144.0, 109.0, 22.0 ],
													"text" : "t defaultspeed play"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-28",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "pause" ],
													"patching_rect" : [ 171.5, 144.0, 48.0, 22.0 ],
													"text" : "t pause"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-27",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "rr", "play" ],
													"patching_rect" : [ 120.5, 144.0, 49.0, 22.0 ],
													"text" : "t rr play"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-26",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "rrr", "play" ],
													"patching_rect" : [ 50.0, 144.0, 53.0, 22.0 ],
													"text" : "t rrr play"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-24",
													"maxclass" : "newobj",
													"numinlets" : 7,
													"numoutlets" : 7,
													"outlettype" : [ "bang", "bang", "bang", "bang", "bang", "bang", "" ],
													"patching_rect" : [ 120.5, 100.0, 127.0, 22.0 ],
													"text" : "sel <<< << || > >> >>>"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-32",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 120.5, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-33",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 215.95452899999998, 226.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-26", 0 ],
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-27", 0 ],
													"source" : [ "obj-24", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-28", 0 ],
													"source" : [ "obj-24", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"source" : [ "obj-24", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 0 ],
													"source" : [ "obj-24", 4 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-31", 0 ],
													"source" : [ "obj-24", 5 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-26", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-27", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-27", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-28", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-29", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-29", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-30", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-30", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-31", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-31", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"source" : [ "obj-32", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 638.5, 234.0, 107.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p createCommand"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 556.5, 129.0, 70.0, 22.0 ],
									"text" : "loadmess 3"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"bgcolor" : [ 0.631372549019608, 0.615686274509804, 0.615686274509804, 1.0 ],
									"bordercolor" : [ 1.0, 0.988235294117647, 0.988235294117647, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-22",
									"maxclass" : "live.tab",
									"num_lines_patching" : 1,
									"num_lines_presentation" : 1,
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 556.5, 156.0, 183.0, 27.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 25.5, 63.0, 708.0, 26.0 ],
									"saved_attribute_attributes" : 									{
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "<<<", "<<", "||", ">", ">>", ">>>" ],
											"parameter_longname" : "live.tab",
											"parameter_mmax" : 5,
											"parameter_shortname" : "live.tab",
											"parameter_type" : 2,
											"parameter_unitstyle" : 9
										}

									}
,
									"textcolor" : [ 0.980392156862745, 0.945098039215686, 0.945098039215686, 1.0 ],
									"varname" : "live.tab"
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
									"border" : 1,
									"bordercolor" : [ 1.0, 1.0, 1.0, 0.99 ],
									"hidden" : 1,
									"id" : "obj-16",
									"ignoreclick" : 0,
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 827.0, 152.0, 320.5, 46.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1.0, 1.0, 759.0, 144.0 ],
									"proportion" : 0.5,
									"rounded" : 0
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"order" : 2,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"order" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"order" : 3,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"order" : 7,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"order" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"order" : 6,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"order" : 8,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"order" : 5,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"order" : 4,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"source" : [ "obj-22", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 1 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 1 ],
									"order" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"order" : 1,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"order" : 3,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"order" : 2,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"order" : 1,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"order" : 0,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 2 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 3 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 4 ],
									"source" : [ "obj-7", 0 ]
								}

							}
 ],
						"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
						"editing_bgcolor" : [ 0.313725490196078, 0.313725490196078, 0.313725490196078, 1.0 ]
					}
,
					"patching_rect" : [ 34.0, 181.620042979717255, 96.0, 35.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.148161082797969, 216.129627883434296, 764.0, 154.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 1,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-3",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "windowControls.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "restoreWindow" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 42.0, 1537.0, 919.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 15,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 12.5, 11.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-74",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 12.5, 169.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "restoreWindow" ],
									"patching_rect" : [ 633.5, 109.0, 95.0, 22.0 ],
									"text" : "t restoreWindow"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-29",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 633.5, 79.5, 44.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 117.0, 215.5, 527.0, 26.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[16]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Restore Default Window",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[16]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "saveWindow" ],
									"patching_rect" : [ 544.5, 109.0, 83.0, 22.0 ],
									"text" : "t saveWindow"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
									"fontface" : 3,
									"fontname" : "Roboto Mono Light",
									"fontsize" : 24.0,
									"hidden" : 1,
									"id" : "obj-24",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 12.5, 46.5, 275.0, 38.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 231.5, 9.0, 314.0, 38.0 ],
									"text" : "BRIGHTSIGN WINDOW",
									"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-15",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 544.5, 81.5, 44.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 117.0, 187.5, 527.0, 26.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[14]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "Save Window Settings",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[14]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "compressY" ],
									"patching_rect" : [ 451.5, 109.0, 75.0, 22.0 ],
									"text" : "t compressY"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "stretchY" ],
									"patching_rect" : [ 394.5, 109.0, 59.0, 22.0 ],
									"text" : "t stretchY"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-12",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 451.5, 81.5, 44.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 457.400000000000091, 154.0, 118.0, 26.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[12]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "h -",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[12]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-13",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 394.5, 81.5, 44.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 457.400000000000091, 85.0, 118.0, 26.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[13]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "h +",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[13]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "compressX" ],
									"patching_rect" : [ 331.5, 109.0, 75.0, 22.0 ],
									"text" : "t compressX"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "stretchX" ],
									"patching_rect" : [ 274.5, 109.0, 59.0, 22.0 ],
									"text" : "t stretchX"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "nudgeDown" ],
									"patching_rect" : [ 218.5, 109.0, 79.0, 22.0 ],
									"text" : "t nudgeDown"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "nudgeUp" ],
									"patching_rect" : [ 161.5, 109.0, 64.0, 22.0 ],
									"text" : "t nudgeUp"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-43",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 331.5, 81.5, 44.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 396.0, 119.0, 118.0, 26.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[6]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "w -",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[6]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-44",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 274.5, 81.5, 44.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 526.0, 119.0, 118.0, 26.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[7]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "w +",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[7]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-45",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 218.5, 81.5, 44.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 183.399999999999977, 85.0, 118.0, 26.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[8]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "y +",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[8]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-46",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 12.5, 81.5, 44.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 117.0, 119.0, 118.0, 26.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[9]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "x -",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "nudgeRight" ],
									"patching_rect" : [ 95.5, 109.0, 77.0, 22.0 ],
									"text" : "t nudgeRight"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-48",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "nudgeLeft" ],
									"patching_rect" : [ 12.5, 109.0, 69.0, 22.0 ],
									"text" : "t nudgeLeft"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-49",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 95.5, 81.5, 44.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 247.0, 119.0, 118.000000000000085, 26.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[10]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "x +",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[10]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
									"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
									"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
									"fontsize" : 13.0,
									"hidden" : 1,
									"id" : "obj-50",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 161.5, 81.5, 44.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 183.399999999999977, 154.0, 118.0, 26.0 ],
									"saved_attribute_attributes" : 									{
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"activetextoncolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_longname" : "live.text[11]",
											"parameter_mmax" : 1,
											"parameter_shortname" : "live.text",
											"parameter_type" : 2
										}

									}
,
									"text" : "y -",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
									"varname" : "live.text[11]"
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
									"border" : 1,
									"bordercolor" : [ 1.0, 1.0, 1.0, 0.99 ],
									"hidden" : 1,
									"id" : "obj-37",
									"ignoreclick" : 0,
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 12.5, 46.5, 720.0, 95.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 0.999999999999943, 1.0, 759.0, 260.0 ],
									"proportion" : 0.5,
									"rounded" : 0
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"order" : 2,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"order" : 3,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"order" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"order" : 11,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"order" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"order" : 10,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 4,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"order" : 5,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"order" : 6,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"order" : 9,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"order" : 8,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"order" : 7,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 0 ],
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"source" : [ "obj-73", 0 ]
								}

							}
 ],
						"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
						"editing_bgcolor" : [ 0.313725490196078, 0.313725490196078, 0.313725490196078, 1.0 ]
					}
,
					"patching_rect" : [ 34.0, 359.5, 96.0, 38.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.148161082797969, 216.129627883434296, 764.0, 326.240966081619263 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 750.878701635769403, 685.721998691558838, 62.0, 22.0 ],
					"text" : "playReset"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 765.878701635769403, 739.721998691558838, 32.0, 22.0 ],
					"text" : "start"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"fontface" : 3,
					"fontname" : "Roboto Mono Light",
					"fontsize" : 42.0,
					"id" : "obj-63",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 82.5, 8.0, 476.0, 62.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.148161082797969, 16.296295895332378, 467.0, 62.0 ],
					"text" : "BRIGHTSIGN UTILITY",
					"textcolor" : [ 0.905882352941176, 0.905882352941176, 0.905882352941176, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 768.679903694561517, 325.434857547283173, 90.0, 22.0 ],
					"text" : "loadmess 9500"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"activebgoncolor" : [ 1.0, 0.992156862745098, 0.976470588235294, 1.0 ],
					"activetextcolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
					"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgoncolor" : [ 0.945098039215686, 0.945098039215686, 0.945098039215686, 1.0 ],
					"bordercolor" : [ 0.890196078431372, 0.890196078431372, 0.890196078431372, 1.0 ],
					"focusbordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
					"fontsize" : 13.0,
					"id" : "obj-58",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 857.497364137853765, 352.990411758422852, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 409.259265302287986, 124.629630386829376, 373.888895332813263, 19.259259521961212 ],
					"saved_attribute_attributes" : 					{
						"activetextcolor" : 						{
							"expression" : ""
						}
,
						"focusbordercolor" : 						{
							"expression" : ""
						}
,
						"activetextoncolor" : 						{
							"expression" : ""
						}
,
						"bgoncolor" : 						{
							"expression" : ""
						}
,
						"activebgoncolor" : 						{
							"expression" : ""
						}
,
						"activebgcolor" : 						{
							"expression" : ""
						}
,
						"bgcolor" : 						{
							"expression" : ""
						}
,
						"bordercolor" : 						{
							"expression" : ""
						}
,
						"textoffcolor" : 						{
							"expression" : ""
						}
,
						"textcolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_longname" : "live.text[15]",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.text",
							"parameter_type" : 2
						}

					}
,
					"text" : "Re-connect",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"textoffcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
					"varname" : "live.text[15]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.964705882352941, 0.964705882352941, 0.964705882352941, 1.0 ],
					"bordercolor" : [ 1.0, 0.996078431372549, 0.996078431372549, 1.0 ],
					"focusbordercolor" : [ 1.0, 0.988235294117647, 0.988235294117647, 1.0 ],
					"fontsize" : 13.0,
					"id" : "obj-55",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 768.679903694561517, 352.990411758422852, 59.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 213.888898192512443, 124.629630386829376, 178.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"focusbordercolor" : 						{
							"expression" : ""
						}
,
						"activebgcolor" : 						{
							"expression" : ""
						}
,
						"bordercolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_longname" : "live.numbox",
							"parameter_mmax" : 65550.0,
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_units" : "Port %d",
							"parameter_unitstyle" : 9
						}

					}
,
					"varname" : "live.numbox"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 690.380382359027863, 875.818385124206543, 164.0, 22.0 ],
					"text" : "udpsend 192.168.0.112 9500"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-12", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-126", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-127", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-130", 0 ],
					"source" : [ "obj-128", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-128", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 0 ],
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-130", 0 ],
					"source" : [ "obj-129", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"source" : [ "obj-131", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"source" : [ "obj-132", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-136", 0 ],
					"source" : [ "obj-134", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-134", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-134", 0 ],
					"source" : [ "obj-135", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-136", 0 ],
					"source" : [ "obj-135", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-136", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 0 ],
					"source" : [ "obj-137", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 0 ],
					"source" : [ "obj-138", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 0 ],
					"source" : [ "obj-138", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-139", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"order" : 4,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"order" : 3,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"order" : 2,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"order" : 1,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"order" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 1 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 775.378701635769403, 834.818385124206543, 699.880382359027863, 834.818385124206543 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 3 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 2 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-126", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"order" : 2,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"order" : 1,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"order" : 0,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-132", 0 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-135", 0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 7 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 5 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 6 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 4 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-138", 0 ],
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-8", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-21" : [ "live.tab[2]", "live.tab", 0 ],
			"obj-22" : [ "live.tab[1]", "live.tab", 0 ],
			"obj-23" : [ "live.numbox[1]", "live.numbox[1]", 0 ],
			"obj-24" : [ "live.numbox[2]", "live.numbox[1]", 0 ],
			"obj-26" : [ "live.numbox[3]", "live.numbox[1]", 0 ],
			"obj-28" : [ "live.numbox[4]", "live.numbox[1]", 0 ],
			"obj-2::obj-22" : [ "live.tab", "live.tab", 0 ],
			"obj-2::obj-3" : [ "live.numbox[8]", "live.numbox[1]", 0 ],
			"obj-2::obj-5" : [ "live.numbox[9]", "live.numbox[1]", 0 ],
			"obj-2::obj-58" : [ "live.text[33]", "live.text", 0 ],
			"obj-2::obj-6" : [ "live.numbox[10]", "live.numbox[1]", 0 ],
			"obj-2::obj-7" : [ "live.numbox[11]", "live.numbox[1]", 0 ],
			"obj-3::obj-12" : [ "live.text[12]", "live.text", 0 ],
			"obj-3::obj-13" : [ "live.text[13]", "live.text", 0 ],
			"obj-3::obj-15" : [ "live.text[14]", "live.text", 0 ],
			"obj-3::obj-29" : [ "live.text[16]", "live.text", 0 ],
			"obj-3::obj-43" : [ "live.text[6]", "live.text", 0 ],
			"obj-3::obj-44" : [ "live.text[7]", "live.text", 0 ],
			"obj-3::obj-45" : [ "live.text[8]", "live.text", 0 ],
			"obj-3::obj-46" : [ "live.text[9]", "live.text", 0 ],
			"obj-3::obj-49" : [ "live.text[10]", "live.text", 0 ],
			"obj-3::obj-50" : [ "live.text[11]", "live.text", 0 ],
			"obj-55" : [ "live.numbox", "live.numbox", 0 ],
			"obj-58" : [ "live.text[15]", "live.text", 0 ],
			"obj-7::obj-132" : [ "live.text[28]", "live.text", 0 ],
			"obj-7::obj-135" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-7::obj-136" : [ "live.text[29]", "live.text", 0 ],
			"obj-7::obj-145" : [ "live.text[30]", "live.text", 0 ],
			"obj-7::obj-152" : [ "live.text[31]", "live.text", 0 ],
			"obj-7::obj-157" : [ "live.text[32]", "live.text", 0 ],
			"obj-7::obj-160" : [ "live.numbox[7]", "live.numbox", 0 ],
			"obj-7::obj-19" : [ "live.text[20]", "live.text", 0 ],
			"obj-7::obj-22" : [ "live.text[26]", "live.text", 0 ],
			"obj-7::obj-23" : [ "live.text[21]", "live.text", 0 ],
			"obj-7::obj-3" : [ "live.text[24]", "live.text", 0 ],
			"obj-7::obj-44" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-7::obj-48" : [ "live.text[22]", "live.text", 0 ],
			"obj-7::obj-52" : [ "live.text[17]", "live.text", 0 ],
			"obj-7::obj-53" : [ "live.text[23]", "live.text", 0 ],
			"obj-7::obj-58" : [ "live.text[25]", "live.text", 0 ],
			"obj-7::obj-64" : [ "live.text[19]", "live.text", 0 ],
			"obj-7::obj-73" : [ "live.text[27]", "live.text", 0 ],
			"obj-7::obj-80" : [ "live.dial", "Volume", 0 ],
			"obj-7::obj-9" : [ "live.text[18]", "live.text", 0 ],
			"parameterbanks" : 			{

			}
,
			"parameter_overrides" : 			{
				"obj-2::obj-3" : 				{
					"parameter_longname" : "live.numbox[8]",
					"parameter_units" : "%dhr"
				}
,
				"obj-2::obj-5" : 				{
					"parameter_longname" : "live.numbox[9]",
					"parameter_range" : [ 0, 59 ],
					"parameter_units" : "%dmin"
				}
,
				"obj-2::obj-58" : 				{
					"parameter_invisible" : 0,
					"parameter_longname" : "live.text[33]",
					"parameter_modmode" : 0,
					"parameter_type" : 2,
					"parameter_unitstyle" : 10
				}
,
				"obj-2::obj-6" : 				{
					"parameter_longname" : "live.numbox[10]",
					"parameter_range" : [ 0, 59 ],
					"parameter_units" : "%dsec"
				}
,
				"obj-2::obj-7" : 				{
					"parameter_invisible" : 0,
					"parameter_longname" : "live.numbox[11]",
					"parameter_modmode" : 0,
					"parameter_range" : [ 0.0, 999.0 ],
					"parameter_type" : 0,
					"parameter_units" : "%dms",
					"parameter_unitstyle" : 9
				}
,
				"obj-7::obj-132" : 				{
					"parameter_invisible" : 0,
					"parameter_longname" : "live.text[28]",
					"parameter_modmode" : 0,
					"parameter_type" : 2,
					"parameter_unitstyle" : 10
				}
,
				"obj-7::obj-135" : 				{
					"parameter_longname" : "live.numbox[6]",
					"parameter_units" : "Player #%d"
				}
,
				"obj-7::obj-136" : 				{
					"parameter_invisible" : 0,
					"parameter_longname" : "live.text[29]",
					"parameter_modmode" : 0,
					"parameter_type" : 2,
					"parameter_unitstyle" : 10
				}
,
				"obj-7::obj-145" : 				{
					"parameter_invisible" : 0,
					"parameter_longname" : "live.text[30]",
					"parameter_modmode" : 0,
					"parameter_type" : 2,
					"parameter_unitstyle" : 10
				}
,
				"obj-7::obj-152" : 				{
					"parameter_invisible" : 0,
					"parameter_longname" : "live.text[31]",
					"parameter_modmode" : 0,
					"parameter_type" : 2,
					"parameter_unitstyle" : 10
				}
,
				"obj-7::obj-157" : 				{
					"parameter_invisible" : 0,
					"parameter_longname" : "live.text[32]",
					"parameter_modmode" : 0,
					"parameter_type" : 2,
					"parameter_unitstyle" : 10
				}
,
				"obj-7::obj-160" : 				{
					"parameter_longname" : "live.numbox[7]",
					"parameter_units" : "Work #%d"
				}
,
				"obj-7::obj-19" : 				{
					"parameter_longname" : "live.text[20]"
				}
,
				"obj-7::obj-22" : 				{
					"parameter_longname" : "live.text[26]"
				}
,
				"obj-7::obj-23" : 				{
					"parameter_longname" : "live.text[21]"
				}
,
				"obj-7::obj-3" : 				{
					"parameter_longname" : "live.text[24]"
				}
,
				"obj-7::obj-44" : 				{
					"parameter_longname" : "live.numbox[5]"
				}
,
				"obj-7::obj-48" : 				{
					"parameter_longname" : "live.text[22]"
				}
,
				"obj-7::obj-52" : 				{
					"parameter_longname" : "live.text[17]"
				}
,
				"obj-7::obj-53" : 				{
					"parameter_longname" : "live.text[23]"
				}
,
				"obj-7::obj-58" : 				{
					"parameter_longname" : "live.text[25]"
				}
,
				"obj-7::obj-64" : 				{
					"parameter_longname" : "live.text[19]"
				}
,
				"obj-7::obj-73" : 				{
					"parameter_longname" : "live.text[27]"
				}
,
				"obj-7::obj-80" : 				{
					"parameter_exponent" : 1.0,
					"parameter_invisible" : 0,
					"parameter_longname" : "live.dial",
					"parameter_modmode" : 0,
					"parameter_range" : [ 0, 100 ],
					"parameter_shortname" : "Volume",
					"parameter_type" : 1,
					"parameter_unitstyle" : 5
				}
,
				"obj-7::obj-9" : 				{
					"parameter_longname" : "live.text[18]"
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "o.route.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "o.compose.mxe64",
				"type" : "mx64"
			}
 ],
		"autosave" : 0,
		"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
		"editing_bgcolor" : [ 0.313725490196078, 0.313725490196078, 0.313725490196078, 1.0 ]
	}

}
