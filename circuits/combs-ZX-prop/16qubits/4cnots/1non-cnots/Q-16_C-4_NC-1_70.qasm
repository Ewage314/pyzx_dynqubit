OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[15];
cx q[15], q[1];
cx q[10], q[13];
cx q[5], q[15];
cx q[4], q[6];
