import { motion, useScroll, useTransform, useInView, AnimatePresence } from "motion/react";
import {
  Music,
  Award,
  BookOpen,
  Mail,
  Phone,
  Star,
  Menu,
  X,
  ChevronDown,
  ExternalLink,
} from "lucide-react";
import { useRef, useState, useEffect } from "react";

/* ─── Reveal on Scroll ─── */
function Reveal({ children, delay = 0, direction = "up", className = "" }: {
  children: React.ReactNode;
  delay?: number;
  direction?: "up" | "left" | "right" | "scale";
  className?: string;
}) {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-80px" });

  const variants = {
    hidden: {
      opacity: 0,
      y: direction === "up" ? 50 : 0,
      x: direction === "left" ? -40 : direction === "right" ? 40 : 0,
      scale: direction === "scale" ? 0.92 : 1,
      filter: "blur(6px)",
    },
    visible: {
      opacity: 1,
      y: 0,
      x: 0,
      scale: 1,
      filter: "blur(0px)",
    },
  };

  return (
    <motion.div
      ref={ref}
      initial="hidden"
      animate={isInView ? "visible" : "hidden"}
      variants={variants}
      transition={{
        duration: 0.8,
        delay,
        ease: [0.16, 1, 0.3, 1],
      }}
      className={className}
    >
      {children}
    </motion.div>
  );
}

/* ─── Section Divider ─── */
function Divider({ dark = false }: { dark?: boolean }) {
  return (
    <div className="flex items-center justify-center gap-4 py-2">
      <div className={`h-[1px] flex-1 max-w-[120px] ${dark ? 'bg-white/10' : 'bg-gold/20'}`} />
      <div className={`w-1.5 h-1.5 rotate-45 ${dark ? 'bg-gold/40' : 'bg-gold/50'}`} />
      <div className={`h-[1px] flex-1 max-w-[120px] ${dark ? 'bg-white/10' : 'bg-gold/20'}`} />
    </div>
  );
}

/* ─── Data ─── */
const archives = [
  {
    institution: "英国利兹大学",
    subject: "教育学认证进修",
    detail: "参与顶级私校冬夏令营交流教学，更新前沿教学理念",
    year: "Professional Certificate",
  },
  {
    institution: "伯克利音乐学院",
    subject: "现代音乐教学体系",
    detail: "深入研习现代音乐架构，融合多元艺术表现形式",
    year: "Advanced Studies",
  },
  {
    institution: "耶鲁大学",
    subject: "古典音乐史进修",
    detail: "夯实古典弦乐理论底蕴，研习西方音乐文化演进轴线",
    year: "Classical Studies",
  },
];

const certifications = [
  "中国爱乐乐团高级教师",
  "中国职工音乐家协会会员",
  "ICM英皇教师联盟会员",
  "ABRSM教师联盟成员",
];

/* ─── Main App ─── */
export default function App() {
  const containerRef = useRef(null);
  const [menuOpen, setMenuOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);

  const { scrollYProgress } = useScroll({
    target: containerRef,
    offset: ["start start", "end end"],
  });

  const backgroundY = useTransform(scrollYProgress, [0, 1], ["0%", "40%"]);
  const heroOpacity = useTransform(scrollYProgress, [0, 0.15], [1, 0]);
  const navBg = useTransform(scrollYProgress, [0, 0.05], ["rgba(255,255,255,0)", "rgba(255,255,255,0.92)"]);

  useEffect(() => {
    const handleScroll = () => setScrolled(window.scrollY > 80);
    window.addEventListener("scroll", handleScroll, { passive: true });
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  const scrollTo = (id: string) => {
    document.getElementById(id)?.scrollIntoView({ behavior: "smooth" });
    setMenuOpen(false);
  };

  const navItems = [
    { id: "biography", label: "艺术传记" },
    { id: "archives", label: "学术档案" },
    { id: "achievements", label: "艺术荣誉" },
    { id: "contact", label: "艺术垂询" },
  ];

  return (
    <div ref={containerRef} className="relative min-h-screen selection:bg-gold/30">

      {/* ─── Navigation ─── */}
      <motion.nav
        style={{ backgroundColor: navBg }}
        className={`fixed top-0 left-0 w-full z-50 px-6 lg:px-12 py-4 flex justify-between items-center backdrop-blur-xl border-b transition-all duration-500 ${
          scrolled ? "border-gold/10 shadow-sm" : "border-transparent"
        }`}
      >
        <a href="#" className="font-display text-lg tracking-[0.25em] font-bold text-crimson hover:text-crimson-deep transition-colors">
          WANG QIYUN
        </a>

        {/* Desktop Nav */}
        <div className="hidden md:flex items-center gap-10 text-[11px] uppercase tracking-[0.2em] font-medium text-ink/70">
          {navItems.map((item) => (
            <button
              key={item.id}
              onClick={() => scrollTo(item.id)}
              className={`nav-link hover:text-gold transition-colors cursor-pointer ${
                item.id === "contact" ? "text-crimson font-bold hover:text-crimson-light" : ""
              }`}
            >
              {item.label}
            </button>
          ))}
        </div>

        {/* Mobile Toggle */}
        <button
          onClick={() => setMenuOpen(!menuOpen)}
          className="md:hidden text-crimson cursor-pointer p-2"
          aria-label="菜单"
        >
          {menuOpen ? <X size={22} /> : <Menu size={22} />}
        </button>
      </motion.nav>

      {/* Mobile Menu */}
      <AnimatePresence>
        {menuOpen && (
          <motion.div
            initial={{ opacity: 0, y: -10 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -10 }}
            transition={{ duration: 0.3 }}
            className="fixed inset-0 top-[64px] z-40 bg-paper/98 backdrop-blur-xl flex flex-col items-center justify-center gap-8"
          >
            {navItems.map((item, i) => (
              <motion.button
                key={item.id}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: i * 0.08 }}
                onClick={() => scrollTo(item.id)}
                className="text-2xl font-display tracking-[0.15em] text-crimson hover:text-gold transition-colors cursor-pointer"
              >
                {item.label}
              </motion.button>
            ))}
          </motion.div>
        )}
      </AnimatePresence>

      {/* ─── Hero Section ─── */}
      <section className="relative h-screen flex items-center justify-center overflow-hidden bg-crimson-deep text-white">
        {/* Textured background */}
        <div className="absolute inset-0 bg-texture opacity-[0.07]" />
        <div className="absolute inset-0 bg-noise opacity-[0.04]" />

        {/* Parallax music icon */}
        <motion.div
          style={{ y: backgroundY }}
          className="absolute inset-0 opacity-[0.06] pointer-events-none"
        >
          <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 scale-150">
            <Music size={900} strokeWidth={0.3} className="text-gold rotate-12" />
          </div>
        </motion.div>

        {/* Decorative corners */}
        <div className="absolute top-8 left-8 w-20 h-20 border-l border-t border-gold/20" />
        <div className="absolute top-8 right-8 w-20 h-20 border-r border-t border-gold/20" />
        <div className="absolute bottom-8 left-8 w-20 h-20 border-l border-b border-gold/20" />
        <div className="absolute bottom-8 right-8 w-20 h-20 border-r border-b border-gold/20" />

        <motion.div style={{ opacity: heroOpacity }} className="container mx-auto px-6 relative z-10">
          <div className="grid grid-cols-1 md:grid-cols-12 gap-8 items-center">
            {/* Side text */}
            <div className="md:col-span-1 hidden lg:block">
              <div className="vertical-text text-[9px] tracking-[0.8em] text-gold/40 uppercase font-medium">
                Professional Cellist & Scholar
              </div>
            </div>

            {/* Main hero content */}
            <div className="md:col-span-5">
              <div className="animate-hero-text">
                {/* Small top label */}
                <div className="flex items-center gap-3 mb-6">
                  <div className="h-[1px] w-10 bg-gold/50" />
                  <span className="text-[10px] tracking-[0.4em] text-gold/70 uppercase font-medium">
                    Cello Virtuoso
                  </span>
                </div>

                <h1 className="hero-title font-display text-6xl sm:text-7xl md:text-[7rem] lg:text-[8rem] leading-[0.82] mb-5 relative">
                  <span className="block">王麒昀</span>
                  <span className="block font-serif italic text-2xl sm:text-3xl md:text-4xl lg:text-[2.8rem] mt-4 text-gold-light font-light tracking-wide">
                    Wang Qiyun
                  </span>
                </h1>

                <div className="flex flex-col gap-4 max-w-md border-l-2 border-gold/25 pl-6 mt-8">
                  <p className="text-base md:text-lg font-serif italic tracking-wide text-white/85 leading-relaxed">
                    "于弦音之间，寻觅古典与现代的学术交响。"
                  </p>
                  <div className="flex gap-4 items-center">
                    <div className="animate-draw-line h-[1px] bg-gold/60" style={{ width: '5rem' }} />
                    <span className="text-[9px] tracking-[0.3em] text-gold/80 font-medium">
                      欧洲学院硕士 · 伯克利·耶鲁认证学者
                    </span>
                  </div>
                </div>
              </div>
            </div>

            {/* Portrait */}
            <div className="md:col-span-6 lg:col-span-6 flex justify-center md:justify-end">
              <div className="relative group">
                <div className="w-[320px] sm:w-[380px] md:w-[340px] lg:w-[420px] h-[460px] sm:h-[530px] md:h-[500px] lg:h-[580px] bg-white/[0.03] border border-gold/15 overflow-hidden poster-shadow">
                  <img
                    src={`${import.meta.env.BASE_URL}portrait.jpg`}
                    alt="王麒昀 - 大提琴家"
                    className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                    referrerPolicy="no-referrer"
                  />
                  {/* Subtle overlay */}
                  <div className="absolute inset-0 bg-gradient-to-t from-crimson-deep/30 via-transparent to-transparent" />
                </div>
                {/* Decorative double frame */}
                <div className="absolute -bottom-5 -left-5 w-28 h-28 border-l-2 border-b-2 border-gold/25" />
                <div className="absolute -top-5 -right-5 w-28 h-28 border-r-2 border-t-2 border-gold/25" />
              </div>
            </div>
          </div>
        </motion.div>

        {/* Scroll indicator */}
        <motion.div
          animate={{ y: [0, 10, 0] }}
          transition={{ duration: 2, repeat: Infinity, ease: "easeInOut" }}
          className="absolute bottom-10 left-1/2 -translate-x-1/2 text-gold/50"
        >
          <ChevronDown size={24} strokeWidth={1} />
        </motion.div>
      </section>

      {/* ─── Biography Section ─── */}
      <section id="biography" className="py-24 md:py-36 bg-white relative bg-texture-lines">
        <div className="container mx-auto px-6 lg:px-12">
          <div className="max-w-6xl mx-auto">
            <div className="grid grid-cols-1 md:grid-cols-12 gap-12 md:gap-20 items-start">
              {/* Left column - sticky */}
              <div className="md:col-span-4">
                <div className="md:sticky md:top-28">
                  <Reveal>
                    <div className="text-gold font-bold text-xs tracking-[0.3em] uppercase mb-3 flex items-center gap-3">
                      <div className="h-[1px] w-8 bg-gold/40" />
                      Biography / 01
                    </div>
                    <h2 className="text-4xl md:text-5xl font-display text-crimson leading-[1.1]">
                      艺术传记
                    </h2>
                  </Reveal>

                  <Reveal delay={0.15}>
                    <div className="mt-10 relative">
                      <div className="bg-crimson text-white p-7 text-sm tracking-wide leading-loose font-serif italic relative overflow-hidden">
                        <div className="absolute top-0 right-0 w-16 h-16 border-r border-t border-gold/20 -translate-y-2 translate-x-2" />
                        "深耕古典弦乐专业领域，系统掌握大提琴演奏技法、音乐理论及教学方法论，具备扎实的专业学术功底与国际化音乐视野。"
                      </div>
                    </div>
                  </Reveal>

                  {/* Decorative stat */}
                  <Reveal delay={0.3}>
                    <div className="mt-10 flex gap-8">
                      <div>
                        <div className="text-3xl font-display text-crimson">10+</div>
                        <div className="text-[10px] tracking-[0.2em] text-warm-gray uppercase mt-1">年演奏经验</div>
                      </div>
                      <div className="w-[1px] bg-gold/15" />
                      <div>
                        <div className="text-3xl font-display text-crimson">3</div>
                        <div className="text-[10px] tracking-[0.2em] text-warm-gray uppercase mt-1">国际学府研习</div>
                      </div>
                    </div>
                  </Reveal>
                </div>
              </div>

              {/* Right column - content */}
              <div className="md:col-span-8 space-y-10">
                <Reveal>
                  <p className="text-xl md:text-[22px] font-serif leading-relaxed text-ink/80 mb-6">
                    王麒昀，青年大提琴演奏家，毕业于欧洲学院硕士专业。职业生涯横跨古典演奏与跨学科音乐研究。
                  </p>
                </Reveal>

                <Reveal delay={0.1}>
                  <p className="text-base text-ink/60 font-serif leading-[1.85]">
                    其演奏风格严谨而富有情感，先后受教于多位国际顶级琴坛名家。在大提琴演奏技法的探索中，始终坚持学术深度与艺术生命力的并重。其学术足迹遍布欧亚美多所顶尖学府，通过对古典音乐史与现代教育体系的沉浸式研习，勾勒出兼具深度与广度的艺术轮廓。
                  </p>
                </Reveal>

                <Reveal delay={0.2}>
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-5 mt-10">
                    {[
                      {
                        title: "古典精髓",
                        quote: "致力于中德等国际音乐文化交流演出，推动古典音乐的当代传播。",
                        icon: "I",
                      },
                      {
                        title: "教育视野",
                        quote: "融合国际前沿理念，构建科学、系统、高效的音乐逻辑体系。",
                        icon: "II",
                      },
                    ].map((item, idx) => (
                      <div
                        key={idx}
                        className="group p-7 border border-gold/10 hover:border-gold/30 transition-all duration-500 card-hover relative overflow-hidden"
                      >
                        <div className="absolute top-3 right-4 text-5xl font-display text-gold/[0.06] leading-none">
                          {item.icon}
                        </div>
                        <div className="text-crimson font-display text-lg mb-3 relative z-10">{item.title}</div>
                        <p className="text-sm text-warm-gray italic leading-relaxed font-serif relative z-10">
                          "{item.quote}"
                        </p>
                      </div>
                    ))}
                  </div>
                </Reveal>
              </div>
            </div>
          </div>
        </div>
      </section>

      <Divider />

      {/* ─── Archives Section ─── */}
      <section id="archives" className="py-24 md:py-32 bg-paper relative overflow-hidden">
        <div className="absolute top-0 right-0 w-1/3 h-full bg-crimson/[0.02]" />
        <div className="absolute bottom-0 left-0 w-1/4 h-1/2 bg-gold/[0.03] rounded-full blur-[120px]" />

        <div className="container mx-auto px-6 lg:px-12 relative z-10">
          <div className="flex flex-col md:flex-row justify-between items-start md:items-end mb-16 gap-6">
            <Reveal>
              <div>
                <div className="text-gold font-bold text-xs tracking-[0.3em] uppercase mb-3 flex items-center gap-3">
                  <div className="h-[1px] w-8 bg-gold/40" />
                  Academic Archives / 02
                </div>
                <h2 className="text-4xl md:text-5xl font-display text-ink">学术档案</h2>
              </div>
            </Reveal>
            <Reveal delay={0.1}>
              <div className="text-sm text-warm-gray italic font-serif">
                Academic Journey & Global Vision
              </div>
            </Reveal>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {archives.map((item, idx) => (
              <Reveal key={idx} delay={idx * 0.12} direction="scale">
                <div className="group p-8 md:p-10 bg-white border border-gold/8 hover:border-gold/20 card-hover relative overflow-hidden h-full">
                  {/* Background number */}
                  <div className="absolute -top-4 -right-2 text-8xl font-display text-crimson/[0.04] leading-none">
                    0{idx + 1}
                  </div>

                  <div className="text-gold mb-6 group-hover:scale-110 transition-transform duration-500">
                    <BookOpen size={28} strokeWidth={1.5} />
                  </div>

                  <h3 className="text-xl md:text-2xl font-serif font-bold text-ink mb-2 relative z-10">
                    {item.institution}
                  </h3>

                  <div className="text-[10px] text-gold-dark font-bold uppercase tracking-[0.2em] mb-5">
                    {item.subject}
                  </div>

                  <p className="text-sm text-warm-gray leading-relaxed font-serif">
                    {item.detail}
                  </p>

                  <div className="mt-6 pt-5 border-t border-gold/8">
                    <span className="text-[10px] tracking-[0.15em] text-gold/60 uppercase font-medium">
                      {item.year}
                    </span>
                  </div>
                </div>
              </Reveal>
            ))}
          </div>
        </div>
      </section>

      <Divider dark />

      {/* ─── Achievements Section ─── */}
      <section id="achievements" className="py-24 md:py-32 bg-crimson-deep text-white relative overflow-hidden">
        <div className="absolute inset-0 bg-texture opacity-[0.05]" />
        <div className="absolute inset-0 bg-noise opacity-[0.03]" />
        <div className="absolute -top-40 -right-40 w-[500px] h-[500px] bg-gold/[0.04] rounded-full blur-[150px]" />

        <div className="container mx-auto px-6 lg:px-12 relative z-10">
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-20 items-center">
            {/* Left - awards */}
            <div className="lg:col-span-5">
              <Reveal>
                <div className="text-gold font-bold text-xs tracking-[0.3em] uppercase mb-3 flex items-center gap-3">
                  <div className="h-[1px] w-8 bg-gold/40" />
                  Distinction / 03
                </div>
                <h2 className="text-4xl md:text-5xl lg:text-6xl font-display text-white mb-10 leading-[1.05]">
                  艺术荣誉<br />与资质
                </h2>
              </Reveal>

              <div className="space-y-7">
                {[
                  "第20届《中国青少年文化艺术交流节》大提琴青年组金奖第一名",
                  "TSP 国际弦乐公开赛 专业奖项得主",
                  "参与中·德音乐文化交流会，核心演职人员",
                ].map((text, i) => (
                  <Reveal key={i} delay={i * 0.1}>
                    <div className="flex gap-5 items-start group">
                      <div className="text-gold mt-1 flex-shrink-0 group-hover:scale-110 transition-transform">
                        <Star fill="currentColor" size={18} />
                      </div>
                      <p className="text-base md:text-lg font-serif leading-relaxed text-white/90 group-hover:text-white transition-colors">
                        {text}
                      </p>
                    </div>
                  </Reveal>
                ))}
              </div>
            </div>

            {/* Right - certifications grid */}
            <div className="lg:col-span-7">
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {certifications.map((cert, i) => (
                  <Reveal key={i} delay={i * 0.08} direction="scale">
                    <div className="p-7 md:p-8 border border-white/8 bg-white/[0.03] backdrop-blur-sm group hover:border-gold/30 transition-all duration-500 card-hover relative overflow-hidden">
                      <div className="absolute top-0 left-0 w-full h-[2px] bg-gradient-to-r from-transparent via-gold/0 to-transparent group-hover:via-gold/40 transition-all duration-500" />
                      <Award className="text-gold/30 group-hover:text-gold mb-5 transition-colors duration-500" size={24} strokeWidth={1.5} />
                      <div className="text-sm font-medium tracking-wider leading-relaxed">{cert}</div>
                    </div>
                  </Reveal>
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* ─── Contact Section ─── */}
      <section id="contact" className="py-28 md:py-36 bg-white relative overflow-hidden bg-texture-lines">
        <div className="absolute top-20 left-10 w-[300px] h-[300px] bg-gold/[0.04] rounded-full blur-[100px]" />
        <div className="absolute bottom-10 right-10 w-[250px] h-[250px] bg-crimson/[0.03] rounded-full blur-[100px]" />

        <div className="container mx-auto px-6 lg:px-12 relative z-10">
          <div className="max-w-4xl mx-auto text-center">
            <Reveal>
              <div className="text-gold font-bold text-xs tracking-[0.3em] uppercase mb-3">
                Contact / 04
              </div>
              <h2 className="font-display text-4xl md:text-5xl text-crimson mb-6">艺术垂询</h2>
              <div className="gold-line max-w-[100px] mx-auto mb-6" />
              <p className="font-serif italic text-lg md:text-xl text-warm-gray mb-16 max-w-lg mx-auto leading-relaxed">
                关于演出合作、专家讲座或学术交流，欢迎通过以下方式联系。
              </p>
            </Reveal>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-10 md:gap-14">
              <Reveal delay={0.1}>
                <div className="group flex flex-col items-center gap-5 p-8 card-hover">
                  <div className="w-16 h-16 rounded-full bg-crimson/5 flex items-center justify-center text-crimson group-hover:bg-crimson group-hover:text-white transition-all duration-500">
                    <Phone size={22} strokeWidth={1.5} />
                  </div>
                  <div className="text-[10px] text-warm-gray uppercase tracking-[0.25em]">联系电话</div>
                  <a href="tel:15306169709" className="text-xl md:text-2xl font-display tracking-wider text-ink hover:text-crimson transition-colors">
                    153 0616 9709
                  </a>
                </div>
              </Reveal>

              <Reveal delay={0.2}>
                <div className="group flex flex-col items-center gap-5 p-8 card-hover">
                  <div className="w-16 h-16 rounded-full bg-crimson/5 flex items-center justify-center text-crimson group-hover:bg-crimson group-hover:text-white transition-all duration-500">
                    <Mail size={22} strokeWidth={1.5} />
                  </div>
                  <div className="text-[10px] text-warm-gray uppercase tracking-[0.25em]">电子邮箱</div>
                  <a href="mailto:oskar22@163.com" className="text-xl md:text-2xl font-display tracking-wider text-ink hover:text-crimson transition-colors">
                    oskar22@163.com
                  </a>
                </div>
              </Reveal>
            </div>
          </div>
        </div>
      </section>

      {/* ─── Footer ─── */}
      <footer className="py-14 bg-ink relative overflow-hidden">
        <div className="absolute inset-0 bg-texture opacity-[0.03]" />
        <div className="container mx-auto px-6 lg:px-12 relative z-10">
          <div className="flex flex-col md:flex-row justify-between items-center gap-6">
            <div className="font-display tracking-[0.3em] text-white text-sm">WANG QIYUN</div>
            <div className="text-[10px] uppercase tracking-[0.2em] italic font-serif text-white/30">
              Official Portfolio of Wang Qiyun, Cellist.
            </div>
            <div className="text-[10px] uppercase tracking-[0.15em] text-white/25">
              © 2026 王麒昀 · 艺术档案
            </div>
          </div>
        </div>
      </footer>
    </div>
  );
}
