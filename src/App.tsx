import { motion, useScroll, useTransform } from "motion/react";
import { 
  Music, 
  Award, 
  BookOpen, 
  Globe, 
  Mail, 
  Phone, 
  ChevronRight, 
  Star,
  Quote,
  CheckCircle2
} from "lucide-react";
import { useRef } from "react";

export default function App() {
  const containerRef = useRef(null);
  const { scrollYProgress } = useScroll({
    target: containerRef,
    offset: ["start start", "end end"]
  });

  const backgroundY = useTransform(scrollYProgress, [0, 1], ["0%", "50%"]);

  return (
    <div ref={containerRef} className="relative min-h-screen selection:bg-gold/30">
      {/* Floating Navigation */}
      <nav className="fixed top-0 left-0 w-full z-50 px-6 py-4 flex justify-between items-center bg-white/80 backdrop-blur-md border-b border-gold/10 text-gray-900">
        <div className="font-display text-xl tracking-widest font-bold text-crimson">WANG QIYUN</div>
        <div className="hidden md:flex gap-8 text-[11px] uppercase tracking-[0.2em] font-medium">
          <a href="#biography" className="hover:text-gold transition-colors">艺术传记</a>
          <a href="#archives" className="hover:text-gold transition-colors">学术档案</a>
          <a href="#achievements" className="hover:text-gold transition-colors">艺术荣誉</a>
          <a href="#contact" className="hover:text-gold transition-colors font-bold text-crimson">艺术垂询</a>
        </div>
      </nav>

      {/* Hero Section - The Artist Identity */}
      <section className="relative h-screen flex items-center justify-center overflow-hidden bg-crimson text-white">
        <div className="absolute inset-0 bg-texture opacity-20"></div>
        <motion.div 
          style={{ y: backgroundY }}
          className="absolute inset-0 opacity-10 pointer-events-none"
        >
          <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 scale-150">
            <Music size={800} strokeWidth={0.5} className="text-gold rotate-12" />
          </div>
        </motion.div>

        <div className="container mx-auto px-6 relative z-10 grid grid-cols-1 md:grid-cols-12 gap-8 items-center">
          <div className="md:col-span-1 hidden md:block">
            <div className="vertical-text text-[10px] tracking-[1em] text-gold/60 uppercase">
              PROFESSIONAL CELLIST & SCHOLAR
            </div>
          </div>
          
          <div className="md:col-span-7">
            <motion.div
              initial={{ opacity: 0, y: 30 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.8, ease: "easeOut" }}
            >
              <h1 className="font-display text-8xl md:text-[12rem] leading-[0.8] mb-6 relative">
                王麒昀
                <span className="block font-serif italic text-4xl md:text-6xl mt-4 text-gold/90 font-light">
                  Wang Qiyun
                </span>
              </h1>
              <div className="flex flex-col gap-6 max-w-xl border-l border-gold/30 pl-6">
                <p className="text-xl md:text-2xl font-serif italic tracking-wide text-white/90 leading-relaxed">
                  “于弦音之间，寻觅古典与现代的学术交响。”
                </p>
                <div className="flex gap-4 items-center">
                  <span className="h-[1px] w-24 bg-gold"></span>
                  <span className="text-xs tracking-[0.4em] uppercase text-gold font-bold">
                    欧洲学院硕士 / 伯克利·耶鲁认证学者
                  </span>
                </div>
              </div>
            </motion.div>
          </div>

          <div className="md:col-span-4 flex justify-end">
            <div className="relative group poster-shadow">
              <div className="w-[320px] h-[480px] bg-white/5 border border-gold/20 overflow-hidden">
                <img 
                  src="/portrait.jpg" 
                  alt="王麒昀 - 大提琴家" 
                  className="w-full h-full object-cover"
                  referrerPolicy="no-referrer"
                />
              </div>
              <div className="absolute -bottom-4 -left-4 w-24 h-24 border-l border-b border-gold opacity-40"></div>
              <div className="absolute -top-4 -right-4 w-24 h-24 border-r border-t border-gold opacity-40"></div>
            </div>
          </div>
        </div>
      </section>

      {/* Biography Section */}
      <section id="biography" className="py-32 bg-white relative">
        <div className="container mx-auto px-6">
          <div className="max-w-5xl mx-auto">
            <div className="grid grid-cols-1 md:grid-cols-12 gap-16 items-start">
               <div className="md:col-span-4">
                 <div className="sticky top-32">
                    <div className="text-gold font-bold text-sm tracking-[0.3em] uppercase mb-4">Biography / 01</div>
                    <h2 className="text-5xl font-display text-crimson leading-tight">艺术传记</h2>
                    <div className="mt-8 space-y-4">
                       <div className="bg-crimson text-white p-6 text-sm tracking-wide leading-loose font-serif italic">
                         “深耕古典弦乐专业领域，系统掌握大提琴演奏技法、音乐理论及教学方法论，具备扎实的专业学术功底与国际化音乐视野。”
                       </div>
                    </div>
                 </div>
               </div>
               <div className="md:col-span-8 space-y-12">
                  <div className="prose prose-lg text-gray-700 font-serif leading-relaxed">
                    <p className="text-xl mb-8">
                       王麒昀，青年大提琴演奏家，毕业于欧洲学院硕士专业。职业生涯横跨古典演奏与跨学科音乐研究。
                    </p>
                    <p className="mb-6">
                       其演奏风格严谨而富有情感，先后受教于多位国际顶级琴坛名家。在大提琴演奏技法的探索中，始终坚持学术深度与艺术生命力的并重。其学术足迹遍布欧亚美多所顶尖学府，通过对古典音乐史与现代教育体系的沉浸式研习，勾勒出兼具深度与广度的艺术轮廓。
                    </p>
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-6 mt-12">
                       <div className="p-8 border border-gray-100 hover:border-gold transition-colors">
                          <div className="text-crimson font-display text-xl mb-4">古典精髓</div>
                          <p className="text-sm text-gray-500 italic">“致力于中德等国际音乐文化交流演出，推动古典音乐的当代传播。”</p>
                       </div>
                       <div className="p-8 border border-gray-100 hover:border-gold transition-colors">
                          <div className="text-crimson font-display text-xl mb-4">教育视野</div>
                          <p className="text-sm text-gray-500 italic">“融合国际前沿理念，构建科学、系统、高效的音乐逻辑体系。”</p>
                       </div>
                    </div>
                  </div>
               </div>
            </div>
          </div>
        </div>
      </section>

      {/* Archives Section */}
      <section id="archives" className="py-24 bg-paper relative overflow-hidden">
        <div className="absolute top-0 right-0 w-1/3 h-full bg-crimson/5"></div>
        <div className="container mx-auto px-6 relative z-10">
          <div className="flex flex-col md:flex-row justify-between items-end mb-16 gap-4">
             <div>
                <div className="text-gold font-bold text-sm tracking-[0.3em] uppercase mb-4">Academic Archives / 02</div>
                <h2 className="text-5xl font-display text-gray-900">学术档案</h2>
             </div>
             <div className="text-sm text-gray-400 italic">Academic Journey & Global Vision</div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
             {[
               {
                 institution: "英国利兹大学",
                 subject: "教育学认证进修",
                 detail: "参与顶级私校冬夏令营交流教学，更新前沿教学理念",
                 color: "crimson"
               },
               {
                 institution: "伯克利音乐学院",
                 subject: "现代音乐教学体系",
                 detail: "深入研习现代音乐架构，融合多元艺术表现形式",
                 color: "gold"
               },
               {
                 institution: "耶鲁大学",
                 subject: "古典音乐史进修",
                 detail: "夯实古典弦乐理论底蕴，研习西方音乐文化演进轴线",
                 color: "gray-900"
               }
             ].map((item, idx) => (
               <div key={idx} className="group p-10 bg-white border border-gray-100 hover:shadow-2xl transition-all duration-500">
                  <div className={`text-${item.color} mb-6`}>
                    <BookOpen size={32} />
                  </div>
                  <h3 className="text-2xl font-serif font-bold text-gray-900 mb-2">{item.institution}</h3>
                  <div className="text-xs text-gold font-bold uppercase tracking-[0.2em] mb-6">{item.subject}</div>
                  <p className="text-gray-500 text-sm leading-relaxed">{item.detail}</p>
               </div>
             ))}
          </div>
        </div>
      </section>

      {/* Achievements Section */}
      <section id="achievements" className="py-24 bg-crimson text-white">
        <div className="container mx-auto px-6">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-16 items-center">
             <div className="lg:col-span-5">
                <div className="text-gold font-bold text-sm tracking-[0.3em] uppercase mb-4">Distinction / 03</div>
                <h2 className="text-5xl md:text-6xl font-display text-white mb-8">艺术荣誉 <br/>与资质</h2>
                <div className="space-y-6">
                   <div className="flex gap-4">
                      <div className="text-gold"><Star fill="currentColor" size={20} /></div>
                      <p className="text-lg font-serif">第20届《中国青少年文化艺术交流节》大提琴青年组金奖第一名</p>
                   </div>
                   <div className="flex gap-4">
                      <div className="text-gold"><Star fill="currentColor" size={20} /></div>
                      <p className="text-lg font-serif">TSP 国际弦乐公开赛 专业奖项得主</p>
                   </div>
                   <div className="flex gap-4">
                      <div className="text-gold"><Star fill="currentColor" size={20} /></div>
                      <p className="text-lg font-serif">参与中·德音乐文化交流会，核心演职人员</p>
                   </div>
                </div>
             </div>
             <div className="lg:col-span-7">
                <div className="grid grid-cols-2 gap-4">
                   {[
                     "中国爱乐乐团高级教师",
                     "中国职工音乐家协会会员",
                     "ICM英皇教师联盟会员",
                     "ABRSM教师联盟成员"
                   ].map((cert, i) => (
                     <div key={i} className="p-8 border border-white/10 bg-white/5 backdrop-blur-sm group hover:border-gold transition-colors">
                        <Award className="text-gold/50 group-hover:text-gold mb-4" />
                        <div className="text-sm font-medium tracking-widest">{cert}</div>
                     </div>
                   ))}
                </div>
             </div>
          </div>
        </div>
      </section>

      {/* Contact Section */}
      <section id="contact" className="py-32 bg-white relative overflow-hidden">
        <div className="container mx-auto px-6">
           <div className="max-w-4xl mx-auto text-center">
              <h2 className="font-display text-5xl text-crimson mb-8">艺术垂询</h2>
              <p className="font-serif italic text-xl text-gray-500 mb-16">
                 关于演出合作、专家讲座或学术交流，欢迎通过以下方式联系。
              </p>
              
              <div className="grid grid-cols-1 md:grid-cols-2 gap-12">
                 <div className="flex flex-col items-center gap-4">
                    <div className="w-16 h-16 rounded-full bg-crimson/5 flex items-center justify-center text-crimson">
                       <Phone size={24} />
                    </div>
                    <div className="text-xs text-gray-400 uppercase tracking-widest">联系电话</div>
                    <div className="text-2xl font-display tracking-widest text-gray-900">15306169709</div>
                 </div>
                 <div className="flex flex-col items-center gap-4">
                    <div className="w-16 h-16 rounded-full bg-crimson/5 flex items-center justify-center text-crimson">
                       <Mail size={24} />
                    </div>
                    <div className="text-xs text-gray-400 uppercase tracking-widest">电子邮箱</div>
                    <div className="text-2xl font-display tracking-widest text-gray-900">oskar22@163.com</div>
                 </div>
              </div>
           </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="py-12 bg-gray-900 border-t border-gold/10 text-white/40">
        <div className="container mx-auto px-6 flex flex-col md:flex-row justify-between items-center gap-8">
          <div className="font-display tracking-[0.3em] text-white">WANG QIYUN</div>
          <div className="text-[10px] uppercase tracking-widest italic font-serif">
            Official Portfolio of Wang Qiyun, Cellist.
          </div>
          <div className="text-[10px] uppercase tracking-widest">
            © 2026 王麒昀. 艺术档案
          </div>
        </div>
      </footer>

      {/* Global CSS Overrides for specific needs */}
      <style>{`
        .vertical-text {
          writing-mode: vertical-rl;
          transform: rotate(180deg);
        }
      `}</style>
    </div>
  );
}
