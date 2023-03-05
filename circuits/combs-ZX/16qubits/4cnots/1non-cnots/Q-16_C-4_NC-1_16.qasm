OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[7];
cx q[11], q[4];
cx q[15], q[7];
cx q[14], q[12];
cx q[10], q[7];
